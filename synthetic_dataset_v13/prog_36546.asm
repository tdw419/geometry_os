; DESCRIPTION: Composite: Places a magenta line segment connecting (472, 132) to (255, 154) then Sets a single cyan pixel at (483, 201) then Places a green 61x42 rectangle at position (133, 119).
; PLAN: r0=472(x1), r1=132(y1), r2=255(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=483(x), r6=201(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=133(x), r11=119(y), r12=61(width), r13=42(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 132
LDI r2, 255
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 201
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 133
LDI r11, 119
LDI r12, 61
LDI r13, 42
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
