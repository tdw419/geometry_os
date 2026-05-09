; DESCRIPTION: Composite: Places a purple circle of radius 12 at center (137, 121) then Renders a red box of size 46x47 starting at (233, 63) then Places a black line segment connecting (206, 38) to (120, 168).
; PLAN: r0=137(x), r1=121(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x), r6=63(y), r7=46(width), r8=47(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x1), r11=38(y1), r12=120(x2), r13=168(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 121
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 63
LDI r7, 46
LDI r8, 47
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 38
LDI r12, 120
LDI r13, 168
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
