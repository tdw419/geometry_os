; DESCRIPTION: Draws a green rectangle at (126, 97) with width 85 and height 79.
; PLAN: r0=126(x), r1=97(y), r2=85(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 97
LDI r2, 85
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
