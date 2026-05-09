; DESCRIPTION: Places a blue 116x67 rectangle at position (185, 119).
; PLAN: r0=185(x), r1=119(y), r2=116(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 119
LDI r2, 116
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
