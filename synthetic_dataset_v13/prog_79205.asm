; DESCRIPTION: Composite: Renders a orange line between points (40, 68) and (429, 231) then Sets a single cyan pixel at (505, 66) then Places a yellow 113x48 rectangle at position (343, 32).
; PLAN: r0=40(x1), r1=68(y1), r2=429(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=505(x), r6=66(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=343(x), r11=32(y), r12=113(width), r13=48(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 40
LDI r1, 68
LDI r2, 429
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 505
LDI r6, 66
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 343
LDI r11, 32
LDI r12, 113
LDI r13, 48
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
