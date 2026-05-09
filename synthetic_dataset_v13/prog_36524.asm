; DESCRIPTION: Places a blue 31x76 rectangle at position (476, 105).
; PLAN: r0=476(x), r1=105(y), r2=31(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 105
LDI r2, 31
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
