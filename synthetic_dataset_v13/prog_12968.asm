; DESCRIPTION: Composite: Renders a black disk with center (422, 150) and radius 55 then Places a purple line segment connecting (432, 141) to (69, 229) then Draws a black rectangle at (353, 207) with width 120 and height 45.
; PLAN: r0=422(x), r1=150(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x1), r6=141(y1), r7=69(x2), r8=229(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=207(y), r12=120(width), r13=45(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 150
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 141
LDI r7, 69
LDI r8, 229
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 207
LDI r12, 120
LDI r13, 45
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
