; DESCRIPTION: Places a black 82x78 rectangle at position (237, 116).
; PLAN: r0=237(x), r1=116(y), r2=82(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 116
LDI r2, 82
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
