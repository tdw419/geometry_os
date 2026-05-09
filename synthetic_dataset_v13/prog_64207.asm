; DESCRIPTION: Composite: Places a orange line segment connecting (194, 93) to (383, 157) then Sets a single blue pixel at (76, 230) then Places a green 23x67 rectangle at position (348, 186).
; PLAN: r0=194(x1), r1=93(y1), r2=383(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=230(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=348(x), r11=186(y), r12=23(width), r13=67(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 93
LDI r2, 383
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 230
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 348
LDI r11, 186
LDI r12, 23
LDI r13, 67
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
