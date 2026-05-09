; DESCRIPTION: Composite: Places a purple line segment connecting (105, 173) to (437, 53) then Sets a single cyan pixel at (93, 31) then Places a orange 59x81 rectangle at position (194, 100).
; PLAN: r0=105(x1), r1=173(y1), r2=437(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=31(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=194(x), r11=100(y), r12=59(width), r13=81(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 173
LDI r2, 437
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 31
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 194
LDI r11, 100
LDI r12, 59
LDI r13, 81
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
