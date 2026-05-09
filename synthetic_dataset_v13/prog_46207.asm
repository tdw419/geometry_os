; DESCRIPTION: Draws a white rectangle at (362, 43) with width 70 and height 68.
; PLAN: r0=362(x), r1=43(y), r2=70(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 43
LDI r2, 70
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
