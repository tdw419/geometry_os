; DESCRIPTION: Composite: Places a yellow line segment connecting (111, 123) to (59, 156) then Creates a green circular shape at (416, 87) with radius 56.
; PLAN: r0=111(x1), r1=123(y1), r2=59(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=87(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 111
LDI r1, 123
LDI r2, 59
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 87
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
