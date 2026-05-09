; DESCRIPTION: Composite: Places a black line segment connecting (419, 148) to (508, 47) then Renders a magenta disk with center (474, 222) and radius 19 then Renders a black box of size 68x63 starting at (52, 116).
; PLAN: r0=419(x1), r1=148(y1), r2=508(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=474(x), r6=222(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=52(x), r11=116(y), r12=68(width), r13=63(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 148
LDI r2, 508
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 222
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 52
LDI r11, 116
LDI r12, 68
LDI r13, 63
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
