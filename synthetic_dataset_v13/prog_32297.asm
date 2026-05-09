; DESCRIPTION: Places a black 13x13 rectangle at position (136, 56).
; PLAN: r0=136(x), r1=56(y), r2=13(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 56
LDI r2, 13
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
