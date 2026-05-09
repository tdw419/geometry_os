; DESCRIPTION: Composite: Places a blue dot at position (64, 15) then Renders a black line between points (492, 231) and (369, 73) then Renders a green box of size 116x69 starting at (203, 163).
; PLAN: r0=64(x), r1=15(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=492(x1), r6=231(y1), r7=369(x2), r8=73(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=203(x), r11=163(y), r12=116(width), r13=69(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 15
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 492
LDI r6, 231
LDI r7, 369
LDI r8, 73
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 163
LDI r12, 116
LDI r13, 69
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
