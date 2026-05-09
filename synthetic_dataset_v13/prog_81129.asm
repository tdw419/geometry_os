; DESCRIPTION: Places a blue 19x106 rectangle at position (12, 122).
; PLAN: r0=12(x), r1=122(y), r2=19(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 122
LDI r2, 19
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
