; DESCRIPTION: Draws a green rectangle at (37, 83) with width 87 and height 113.
; PLAN: r0=37(x), r1=83(y), r2=87(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 83
LDI r2, 87
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
