; DESCRIPTION: Draws a green rectangle at (231, 106) with width 63 and height 82.
; PLAN: r0=231(x), r1=106(y), r2=63(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 106
LDI r2, 63
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
