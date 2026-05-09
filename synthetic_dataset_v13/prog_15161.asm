; DESCRIPTION: Places a black 76x98 rectangle at position (402, 119).
; PLAN: r0=402(x), r1=119(y), r2=76(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 119
LDI r2, 76
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
