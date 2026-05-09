; DESCRIPTION: Draws a white rectangle at (25, 178) with width 62 and height 46.
; PLAN: r0=25(x), r1=178(y), r2=62(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 178
LDI r2, 62
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
