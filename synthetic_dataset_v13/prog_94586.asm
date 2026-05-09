; DESCRIPTION: Places a black 62x12 rectangle at position (159, 84).
; PLAN: r0=159(x), r1=84(y), r2=62(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 84
LDI r2, 62
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
