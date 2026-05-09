; DESCRIPTION: Composite: Places a yellow 84x101 rectangle at position (86, 144) then Renders a orange line between points (153, 219) and (42, 168) then Sets a single magenta pixel at (202, 162).
; PLAN: r0=86(x), r1=144(y), r2=84(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x1), r6=219(y1), r7=42(x2), r8=168(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=162(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 86
LDI r1, 144
LDI r2, 84
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 219
LDI r7, 42
LDI r8, 168
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 162
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
