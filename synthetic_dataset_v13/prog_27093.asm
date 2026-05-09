; DESCRIPTION: Composite: Places a cyan 84x119 rectangle at position (26, 124) then Sets a single red pixel at (176, 89) then Renders a magenta line between points (168, 93) and (139, 220).
; PLAN: r0=26(x), r1=124(y), r2=84(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=89(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=168(x1), r11=93(y1), r12=139(x2), r13=220(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 124
LDI r2, 84
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 89
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 168
LDI r11, 93
LDI r12, 139
LDI r13, 220
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
