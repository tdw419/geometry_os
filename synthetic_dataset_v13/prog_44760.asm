; DESCRIPTION: Composite: Renders a blue line between points (173, 62) and (231, 156) then Places a cyan 119x23 rectangle at position (165, 145) then Draws a cyan circle centered at (440, 69) with radius 19.
; PLAN: r0=173(x1), r1=62(y1), r2=231(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=145(y), r7=119(width), r8=23(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=440(x), r11=69(y), r12=19(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 62
LDI r2, 231
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 145
LDI r7, 119
LDI r8, 23
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 69
LDI r12, 19
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
