; DESCRIPTION: Places a blue 72x14 rectangle at position (200, 116).
; PLAN: r0=200(x), r1=116(y), r2=72(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 116
LDI r2, 72
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
