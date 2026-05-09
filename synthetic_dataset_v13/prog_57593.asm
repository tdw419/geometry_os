; DESCRIPTION: Places a black 80x49 rectangle at position (321, 116).
; PLAN: r0=321(x), r1=116(y), r2=80(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 116
LDI r2, 80
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
