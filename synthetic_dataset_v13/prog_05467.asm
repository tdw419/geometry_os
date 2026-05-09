; DESCRIPTION: Places a blue 53x26 rectangle at position (26, 227).
; PLAN: r0=26(x), r1=227(y), r2=53(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 227
LDI r2, 53
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
