; DESCRIPTION: Composite: Draws a cyan line from (426, 199) to (0, 100) then Places a cyan dot at position (3, 7).
; PLAN: r0=426(x1), r1=199(y1), r2=0(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=3(x), r6=7(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 199
LDI r2, 0
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 7
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
