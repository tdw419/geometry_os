; DESCRIPTION: Composite: Places a yellow line segment connecting (475, 205) to (256, 3) then Creates a yellow circular shape at (67, 145) with radius 12.
; PLAN: r0=475(x1), r1=205(y1), r2=256(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=145(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 475
LDI r1, 205
LDI r2, 256
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 145
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
