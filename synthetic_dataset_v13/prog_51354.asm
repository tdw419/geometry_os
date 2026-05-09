; DESCRIPTION: Composite: Creates a blue rectangular region at (288, 67) spanning 98 by 22 pixels then Places a white line segment connecting (432, 180) to (47, 200) then Renders a purple disk with center (201, 202) and radius 41.
; PLAN: r0=288(x), r1=67(y), r2=98(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x1), r6=180(y1), r7=47(x2), r8=200(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=201(x), r11=202(y), r12=41(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 288
LDI r1, 67
LDI r2, 98
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 180
LDI r7, 47
LDI r8, 200
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 202
LDI r12, 41
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
