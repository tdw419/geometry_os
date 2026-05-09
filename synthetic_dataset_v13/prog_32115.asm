; DESCRIPTION: Places a blue 116x100 rectangle at position (133, 2).
; PLAN: r0=133(x), r1=2(y), r2=116(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 2
LDI r2, 116
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
