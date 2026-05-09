; DESCRIPTION: Composite: Places a blue line segment connecting (81, 202) to (430, 167) then Places a yellow dot at position (14, 185).
; PLAN: r0=81(x1), r1=202(y1), r2=430(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=185(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 81
LDI r1, 202
LDI r2, 430
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 185
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
