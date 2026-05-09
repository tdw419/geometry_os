; DESCRIPTION: Composite: Places a red line segment connecting (184, 200) to (419, 41) then Renders a purple disk with center (286, 158) and radius 50 then Renders a red box of size 105x28 starting at (217, 25).
; PLAN: r0=184(x1), r1=200(y1), r2=419(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=158(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x), r11=25(y), r12=105(width), r13=28(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 200
LDI r2, 419
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 158
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 25
LDI r12, 105
LDI r13, 28
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
