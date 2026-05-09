; DESCRIPTION: Composite: Places a blue line segment connecting (172, 145) to (340, 217) then Draws a cyan circle centered at (312, 179) with radius 40.
; PLAN: r0=172(x1), r1=145(y1), r2=340(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=179(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 145
LDI r2, 340
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 179
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
