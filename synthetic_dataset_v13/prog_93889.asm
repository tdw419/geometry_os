; DESCRIPTION: Composite: Places a purple line segment connecting (242, 131) to (458, 13) then Creates a black circular shape at (359, 234) with radius 22.
; PLAN: r0=242(x1), r1=131(y1), r2=458(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=234(y), r7=22(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 131
LDI r2, 458
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 234
LDI r7, 22
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
