; DESCRIPTION: Places a black 43x93 rectangle at position (87, 35).
; PLAN: r0=87(x), r1=35(y), r2=43(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 35
LDI r2, 43
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
