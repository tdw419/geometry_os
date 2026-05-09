; DESCRIPTION: Composite: Renders a red box of size 62x54 starting at (337, 92) then Places a orange line segment connecting (284, 209) to (92, 95) then Places a purple circle of radius 44 at center (216, 118).
; PLAN: r0=337(x), r1=92(y), r2=62(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x1), r6=209(y1), r7=92(x2), r8=95(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=118(y), r12=44(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 92
LDI r2, 62
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 209
LDI r7, 92
LDI r8, 95
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 118
LDI r12, 44
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
