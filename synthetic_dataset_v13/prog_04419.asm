; DESCRIPTION: Draws a blue rectangle at (161, 38) with width 105 and height 46.
; PLAN: r0=161(x), r1=38(y), r2=105(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 38
LDI r2, 105
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
