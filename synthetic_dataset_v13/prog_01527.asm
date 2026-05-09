; DESCRIPTION: Places a blue 79x30 rectangle at position (148, 116).
; PLAN: r0=148(x), r1=116(y), r2=79(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 116
LDI r2, 79
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
