; DESCRIPTION: Composite: Places a blue line segment connecting (2, 179) to (438, 11) then Places a blue 108x92 rectangle at position (79, 154) then Draws a cyan circle centered at (256, 138) with radius 57.
; PLAN: r0=2(x1), r1=179(y1), r2=438(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=154(y), r7=108(width), r8=92(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x), r11=138(y), r12=57(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 179
LDI r2, 438
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 154
LDI r7, 108
LDI r8, 92
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 138
LDI r12, 57
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
