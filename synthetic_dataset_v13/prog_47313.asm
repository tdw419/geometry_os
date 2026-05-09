; DESCRIPTION: Composite: Renders a magenta line between points (97, 236) and (10, 130) then Places a cyan dot at position (51, 95).
; PLAN: r0=97(x1), r1=236(y1), r2=10(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=95(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 236
LDI r2, 10
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 95
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
