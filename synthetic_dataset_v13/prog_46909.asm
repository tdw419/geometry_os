; DESCRIPTION: Composite: Renders a white disk with center (230, 88) and radius 73 then Renders a red box of size 112x71 starting at (185, 121) then Renders a purple line between points (313, 25) and (70, 61).
; PLAN: r0=230(x), r1=88(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x), r6=121(y), r7=112(width), r8=71(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x1), r11=25(y1), r12=70(x2), r13=61(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 88
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 121
LDI r7, 112
LDI r8, 71
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 25
LDI r12, 70
LDI r13, 61
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
