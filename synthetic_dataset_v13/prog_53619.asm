; DESCRIPTION: Draws a yellow rectangle at (70, 184) with width 78 and height 26.
; PLAN: r0=70(x), r1=184(y), r2=78(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 184
LDI r2, 78
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
