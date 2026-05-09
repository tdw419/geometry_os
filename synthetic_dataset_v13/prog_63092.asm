; DESCRIPTION: Composite: Places a magenta 29x66 rectangle at position (427, 55) then Places a green line segment connecting (163, 2) to (365, 181) then Renders a red disk with center (299, 96) and radius 45.
; PLAN: r0=427(x), r1=55(y), r2=29(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x1), r6=2(y1), r7=365(x2), r8=181(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=96(y), r12=45(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 427
LDI r1, 55
LDI r2, 29
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 2
LDI r7, 365
LDI r8, 181
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 96
LDI r12, 45
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
