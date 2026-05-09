; DESCRIPTION: Composite: Draws a blue line from (131, 155) to (311, 93) then Sets a single red pixel at (162, 238) then Places a cyan 62x28 rectangle at position (24, 187).
; PLAN: r0=131(x1), r1=155(y1), r2=311(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=238(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=24(x), r11=187(y), r12=62(width), r13=28(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 155
LDI r2, 311
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 238
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 24
LDI r11, 187
LDI r12, 62
LDI r13, 28
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
