; DESCRIPTION: Composite: Renders a yellow box of size 88x17 starting at (191, 130) then Renders a white line between points (185, 176) and (110, 38) then Creates a white circular shape at (284, 162) with radius 61.
; PLAN: r0=191(x), r1=130(y), r2=88(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x1), r6=176(y1), r7=110(x2), r8=38(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=284(x), r11=162(y), r12=61(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 191
LDI r1, 130
LDI r2, 88
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 176
LDI r7, 110
LDI r8, 38
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 162
LDI r12, 61
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
