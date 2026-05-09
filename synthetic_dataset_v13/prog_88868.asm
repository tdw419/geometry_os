; DESCRIPTION: Draws a green rectangle at (231, 6) with width 39 and height 35.
; PLAN: r0=231(x), r1=6(y), r2=39(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 6
LDI r2, 39
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
