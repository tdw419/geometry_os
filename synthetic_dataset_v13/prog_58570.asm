; DESCRIPTION: Composite: Places a blue line segment connecting (318, 163) to (505, 42) then Renders a orange box of size 87x120 starting at (55, 79) then Places a blue dot at position (56, 251).
; PLAN: r0=318(x1), r1=163(y1), r2=505(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=79(y), r7=87(width), r8=120(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=56(x), r11=251(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 318
LDI r1, 163
LDI r2, 505
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 79
LDI r7, 87
LDI r8, 120
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 251
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
