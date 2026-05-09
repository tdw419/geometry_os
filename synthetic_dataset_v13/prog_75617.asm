; DESCRIPTION: Places a black 83x62 rectangle at position (258, 126).
; PLAN: r0=258(x), r1=126(y), r2=83(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 126
LDI r2, 83
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
