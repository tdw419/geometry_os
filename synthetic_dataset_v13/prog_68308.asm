; DESCRIPTION: Places a black 70x114 rectangle at position (351, 133).
; PLAN: r0=351(x), r1=133(y), r2=70(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 133
LDI r2, 70
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
