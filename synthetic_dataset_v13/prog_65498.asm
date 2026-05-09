; DESCRIPTION: Composite: Renders a orange box of size 67x61 starting at (44, 130) then Places a blue circle of radius 60 at center (357, 176) then Places a white line segment connecting (250, 147) to (254, 29).
; PLAN: r0=44(x), r1=130(y), r2=67(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=176(y), r7=60(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=250(x1), r11=147(y1), r12=254(x2), r13=29(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 130
LDI r2, 67
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 176
LDI r7, 60
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 250
LDI r11, 147
LDI r12, 254
LDI r13, 29
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
