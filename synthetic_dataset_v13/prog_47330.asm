; DESCRIPTION: Places a blue 88x43 rectangle at position (49, 176).
; PLAN: r0=49(x), r1=176(y), r2=88(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 176
LDI r2, 88
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
