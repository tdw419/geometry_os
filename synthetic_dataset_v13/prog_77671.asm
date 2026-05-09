; DESCRIPTION: Draws a blue rectangle at (246, 161) with width 77 and height 43.
; PLAN: r0=246(x), r1=161(y), r2=77(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 161
LDI r2, 77
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
