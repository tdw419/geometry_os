; DESCRIPTION: Places a blue 17x105 rectangle at position (49, 63).
; PLAN: r0=49(x), r1=63(y), r2=17(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 63
LDI r2, 17
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
