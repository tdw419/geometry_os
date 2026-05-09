; DESCRIPTION: Composite: Places a purple circle of radius 33 at center (93, 55) then Places a blue line segment connecting (134, 190) to (59, 1) then Renders a black box of size 74x98 starting at (411, 42).
; PLAN: r0=93(x), r1=55(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x1), r6=190(y1), r7=59(x2), r8=1(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=411(x), r11=42(y), r12=74(width), r13=98(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 55
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 190
LDI r7, 59
LDI r8, 1
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 42
LDI r12, 74
LDI r13, 98
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
