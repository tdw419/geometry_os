; DESCRIPTION: Places a black 60x107 rectangle at position (451, 14).
; PLAN: r0=451(x), r1=14(y), r2=60(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 14
LDI r2, 60
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
