; DESCRIPTION: Composite: Places a orange line segment connecting (426, 215) to (484, 222) then Sets a single purple pixel at (72, 50) then Places a green 93x83 rectangle at position (345, 79).
; PLAN: r0=426(x1), r1=215(y1), r2=484(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=50(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=345(x), r11=79(y), r12=93(width), r13=83(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 215
LDI r2, 484
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 50
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 345
LDI r11, 79
LDI r12, 93
LDI r13, 83
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
