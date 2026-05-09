; DESCRIPTION: Draws a white rectangle at (65, 181) with width 102 and height 62.
; PLAN: r0=65(x), r1=181(y), r2=102(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 181
LDI r2, 102
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
