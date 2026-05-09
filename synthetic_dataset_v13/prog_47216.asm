; DESCRIPTION: Draws a white rectangle at (393, 155) with width 108 and height 74.
; PLAN: r0=393(x), r1=155(y), r2=108(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 155
LDI r2, 108
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
