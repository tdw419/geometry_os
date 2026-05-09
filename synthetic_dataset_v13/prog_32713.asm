; DESCRIPTION: Draws a blue rectangle at (355, 161) with width 76 and height 21.
; PLAN: r0=355(x), r1=161(y), r2=76(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 161
LDI r2, 76
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
