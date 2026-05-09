; DESCRIPTION: Composite: Renders a green line between points (456, 218) and (470, 118) then Places a orange 110x20 rectangle at position (113, 126) then Sets a single magenta pixel at (91, 179).
; PLAN: r0=456(x1), r1=218(y1), r2=470(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=126(y), r7=110(width), r8=20(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x), r11=179(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 456
LDI r1, 218
LDI r2, 470
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 126
LDI r7, 110
LDI r8, 20
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 179
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
