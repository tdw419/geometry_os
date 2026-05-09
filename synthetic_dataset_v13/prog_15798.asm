; DESCRIPTION: Composite: Places a purple line segment connecting (0, 225) to (422, 213) then Creates a red rectangular region at (416, 15) spanning 55 by 12 pixels then Places a blue circle of radius 20 at center (288, 22).
; PLAN: r0=0(x1), r1=225(y1), r2=422(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=15(y), r7=55(width), r8=12(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=288(x), r11=22(y), r12=20(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 0
LDI r1, 225
LDI r2, 422
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 15
LDI r7, 55
LDI r8, 12
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 22
LDI r12, 20
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
