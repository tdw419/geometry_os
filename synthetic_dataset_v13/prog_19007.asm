; DESCRIPTION: Composite: Renders a yellow disk with center (481, 214) and radius 20 then Renders a purple line between points (104, 176) and (104, 186) then Renders a purple box of size 100x69 starting at (35, 74).
; PLAN: r0=481(x), r1=214(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x1), r6=176(y1), r7=104(x2), r8=186(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=35(x), r11=74(y), r12=100(width), r13=69(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 481
LDI r1, 214
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 176
LDI r7, 104
LDI r8, 186
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 74
LDI r12, 100
LDI r13, 69
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
