; DESCRIPTION: Places a black 43x21 rectangle at position (119, 211).
; PLAN: r0=119(x), r1=211(y), r2=43(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 211
LDI r2, 43
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
