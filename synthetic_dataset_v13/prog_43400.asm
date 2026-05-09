; DESCRIPTION: Draws a blue rectangle at (171, 161) with width 54 and height 22.
; PLAN: r0=171(x), r1=161(y), r2=54(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 161
LDI r2, 54
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
