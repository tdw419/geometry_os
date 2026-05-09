; DESCRIPTION: Composite: Renders a magenta line between points (458, 37) and (328, 176) then Places a black dot at position (368, 119).
; PLAN: r0=458(x1), r1=37(y1), r2=328(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=119(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 458
LDI r1, 37
LDI r2, 328
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 119
LDI r7, 0x000000
PSET r5, r6, r7
HALT
