; DESCRIPTION: Places a black 43x78 rectangle at position (58, 108).
; PLAN: r0=58(x), r1=108(y), r2=43(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 108
LDI r2, 43
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
