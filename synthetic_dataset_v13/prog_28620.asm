; DESCRIPTION: Composite: Renders a blue line between points (119, 23) and (115, 39) then Places a green 60x24 rectangle at position (154, 191) then Creates a white circular shape at (388, 145) with radius 55.
; PLAN: r0=119(x1), r1=23(y1), r2=115(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=191(y), r7=60(width), r8=24(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=388(x), r11=145(y), r12=55(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 119
LDI r1, 23
LDI r2, 115
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 191
LDI r7, 60
LDI r8, 24
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 145
LDI r12, 55
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
