; DESCRIPTION: Composite: Places a green 103x104 rectangle at position (338, 97) then Renders a magenta line between points (73, 149) and (505, 226) then Sets a single orange pixel at (265, 55).
; PLAN: r0=338(x), r1=97(y), r2=103(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x1), r6=149(y1), r7=505(x2), r8=226(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=55(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 338
LDI r1, 97
LDI r2, 103
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 149
LDI r7, 505
LDI r8, 226
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 55
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
