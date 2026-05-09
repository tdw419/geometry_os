; DESCRIPTION: Composite: Places a yellow line segment connecting (5, 225) to (78, 151) then Draws a orange circle centered at (324, 86) with radius 56.
; PLAN: r0=5(x1), r1=225(y1), r2=78(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=86(y), r7=56(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 5
LDI r1, 225
LDI r2, 78
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 86
LDI r7, 56
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
