; DESCRIPTION: Composite: Places a purple line segment connecting (303, 6) to (424, 193) then Creates a purple circular shape at (386, 183) with radius 66 then Renders a yellow box of size 88x67 starting at (320, 42).
; PLAN: r0=303(x1), r1=6(y1), r2=424(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=183(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=320(x), r11=42(y), r12=88(width), r13=67(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 6
LDI r2, 424
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 183
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 320
LDI r11, 42
LDI r12, 88
LDI r13, 67
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
