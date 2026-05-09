; DESCRIPTION: Composite: Places a cyan 36x95 rectangle at position (303, 160) then Sets a single purple pixel at (61, 165) then Draws a orange line from (93, 241) to (229, 64).
; PLAN: r0=303(x), r1=160(y), r2=36(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x), r6=165(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=93(x1), r11=241(y1), r12=229(x2), r13=64(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 160
LDI r2, 36
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 165
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 93
LDI r11, 241
LDI r12, 229
LDI r13, 64
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
