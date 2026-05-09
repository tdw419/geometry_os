; DESCRIPTION: Draws a white rectangle at (59, 123) with width 46 and height 69.
; PLAN: r0=59(x), r1=123(y), r2=46(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 123
LDI r2, 46
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
