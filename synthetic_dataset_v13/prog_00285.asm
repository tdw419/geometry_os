; DESCRIPTION: Composite: Renders a purple line between points (423, 54) and (445, 210) then Creates a black rectangular region at (21, 5) spanning 58 by 69 pixels then Places a white circle of radius 38 at center (360, 109).
; PLAN: r0=423(x1), r1=54(y1), r2=445(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=21(x), r6=5(y), r7=58(width), r8=69(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=360(x), r11=109(y), r12=38(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 423
LDI r1, 54
LDI r2, 445
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 5
LDI r7, 58
LDI r8, 69
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 109
LDI r12, 38
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
