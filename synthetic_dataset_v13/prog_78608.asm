; DESCRIPTION: Places a black 68x36 rectangle at position (219, 79).
; PLAN: r0=219(x), r1=79(y), r2=68(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 79
LDI r2, 68
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
