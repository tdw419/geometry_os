; DESCRIPTION: Draws a yellow rectangle at (70, 76) with width 38 and height 105.
; PLAN: r0=70(x), r1=76(y), r2=38(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 76
LDI r2, 38
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
