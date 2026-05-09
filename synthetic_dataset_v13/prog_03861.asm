; DESCRIPTION: Composite: Renders a black line between points (46, 236) and (88, 255) then Places a blue dot at position (442, 20) then Creates a magenta rectangular region at (78, 70) spanning 102 by 37 pixels.
; PLAN: r0=46(x1), r1=236(y1), r2=88(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=20(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=78(x), r11=70(y), r12=102(width), r13=37(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 236
LDI r2, 88
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 20
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 78
LDI r11, 70
LDI r12, 102
LDI r13, 37
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
