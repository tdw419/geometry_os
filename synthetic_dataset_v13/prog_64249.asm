; DESCRIPTION: Draws a green rectangle at (231, 148) with width 79 and height 49.
; PLAN: r0=231(x), r1=148(y), r2=79(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 148
LDI r2, 79
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
