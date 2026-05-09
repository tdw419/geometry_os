; DESCRIPTION: Places a green 114x110 rectangle at position (118, 116).
; PLAN: r0=118(x), r1=116(y), r2=114(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 116
LDI r2, 114
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
