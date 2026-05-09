; DESCRIPTION: Composite: Renders a blue line between points (303, 88) and (351, 95) then Places a yellow dot at position (274, 198) then Renders a blue box of size 77x108 starting at (108, 32).
; PLAN: r0=303(x1), r1=88(y1), r2=351(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=198(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=108(x), r11=32(y), r12=77(width), r13=108(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 88
LDI r2, 351
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 198
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 108
LDI r11, 32
LDI r12, 77
LDI r13, 108
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
