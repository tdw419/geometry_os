; DESCRIPTION: Composite: Places a black 83x69 rectangle at position (5, 156) then Creates a magenta circular shape at (236, 158) with radius 32 then Renders a blue line between points (90, 203) and (458, 169).
; PLAN: r0=5(x), r1=156(y), r2=83(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=158(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=90(x1), r11=203(y1), r12=458(x2), r13=169(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 156
LDI r2, 83
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 158
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 90
LDI r11, 203
LDI r12, 458
LDI r13, 169
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
