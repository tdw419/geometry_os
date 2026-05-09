; DESCRIPTION: Composite: Renders a orange line between points (87, 119) and (337, 76) then Sets a single green pixel at (158, 201) then Places a magenta 48x71 rectangle at position (413, 23).
; PLAN: r0=87(x1), r1=119(y1), r2=337(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=201(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=413(x), r11=23(y), r12=48(width), r13=71(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 119
LDI r2, 337
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 201
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 413
LDI r11, 23
LDI r12, 48
LDI r13, 71
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
