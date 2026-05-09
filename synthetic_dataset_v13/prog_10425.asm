; DESCRIPTION: Composite: Renders a blue box of size 14x111 starting at (419, 141) then Draws a cyan circle centered at (133, 104) with radius 18 then Places a purple line segment connecting (370, 133) to (348, 216).
; PLAN: r0=419(x), r1=141(y), r2=14(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x), r6=104(y), r7=18(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x1), r11=133(y1), r12=348(x2), r13=216(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 141
LDI r2, 14
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 104
LDI r7, 18
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 133
LDI r12, 348
LDI r13, 216
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
