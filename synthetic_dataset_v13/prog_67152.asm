; DESCRIPTION: Composite: Renders a yellow line between points (81, 18) and (14, 179) then Sets a single blue pixel at (6, 178).
; PLAN: r0=81(x1), r1=18(y1), r2=14(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=178(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 81
LDI r1, 18
LDI r2, 14
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 178
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
