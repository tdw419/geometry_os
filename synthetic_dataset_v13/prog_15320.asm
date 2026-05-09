; DESCRIPTION: Places a blue 116x23 rectangle at position (115, 53).
; PLAN: r0=115(x), r1=53(y), r2=116(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 53
LDI r2, 116
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
