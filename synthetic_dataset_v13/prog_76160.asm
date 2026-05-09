; DESCRIPTION: Places a black 108x84 rectangle at position (142, 82).
; PLAN: r0=142(x), r1=82(y), r2=108(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 82
LDI r2, 108
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
