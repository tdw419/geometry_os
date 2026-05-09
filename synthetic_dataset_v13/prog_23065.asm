; DESCRIPTION: Composite: Places a blue line segment connecting (377, 213) to (474, 35) then Creates a yellow circular shape at (459, 12) with radius 12 then Renders a orange box of size 119x91 starting at (14, 44).
; PLAN: r0=377(x1), r1=213(y1), r2=474(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=459(x), r6=12(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=14(x), r11=44(y), r12=119(width), r13=91(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 213
LDI r2, 474
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 12
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 14
LDI r11, 44
LDI r12, 119
LDI r13, 91
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
