; DESCRIPTION: Draws a blue rectangle at (37, 133) with width 27 and height 43.
; PLAN: r0=37(x), r1=133(y), r2=27(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 133
LDI r2, 27
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
