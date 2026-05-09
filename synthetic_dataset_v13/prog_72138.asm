; DESCRIPTION: Places a black 35x24 rectangle at position (282, 216).
; PLAN: r0=282(x), r1=216(y), r2=35(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 216
LDI r2, 35
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
