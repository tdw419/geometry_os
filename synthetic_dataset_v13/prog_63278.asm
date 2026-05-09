; DESCRIPTION: Composite: Renders a orange disk with center (263, 88) and radius 73 then Renders a yellow box of size 49x63 starting at (58, 161) then Draws a purple line from (383, 173) to (400, 116).
; PLAN: r0=263(x), r1=88(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x), r6=161(y), r7=49(width), r8=63(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x1), r11=173(y1), r12=400(x2), r13=116(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 88
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 161
LDI r7, 49
LDI r8, 63
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 173
LDI r12, 400
LDI r13, 116
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
