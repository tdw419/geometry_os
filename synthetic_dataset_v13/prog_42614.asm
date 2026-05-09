; DESCRIPTION: Places a blue 117x106 rectangle at position (142, 116).
; PLAN: r0=142(x), r1=116(y), r2=117(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 116
LDI r2, 117
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
