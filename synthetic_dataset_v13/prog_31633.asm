; DESCRIPTION: Places a black 19x37 rectangle at position (136, 30).
; PLAN: r0=136(x), r1=30(y), r2=19(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 30
LDI r2, 19
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
