; DESCRIPTION: Composite: Renders a green disk with center (341, 68) and radius 13 then Creates a blue rectangular region at (144, 20) spanning 14 by 52 pixels then Places a blue line segment connecting (418, 45) to (488, 223).
; PLAN: r0=341(x), r1=68(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x), r6=20(y), r7=14(width), r8=52(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x1), r11=45(y1), r12=488(x2), r13=223(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 68
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 20
LDI r7, 14
LDI r8, 52
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 45
LDI r12, 488
LDI r13, 223
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
