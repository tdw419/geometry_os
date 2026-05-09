; DESCRIPTION: Places a black 13x105 rectangle at position (63, 114).
; PLAN: r0=63(x), r1=114(y), r2=13(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 114
LDI r2, 13
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
