; DESCRIPTION: Places a purple 118x15 rectangle at position (17, 106).
; PLAN: r0=17(x), r1=106(y), r2=118(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 106
LDI r2, 118
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
