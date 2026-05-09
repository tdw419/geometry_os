; DESCRIPTION: Places a black 84x67 rectangle at position (219, 116).
; PLAN: r0=219(x), r1=116(y), r2=84(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 116
LDI r2, 84
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
