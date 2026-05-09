; DESCRIPTION: Draws a blue rectangle at (254, 29) with width 47 and height 68.
; PLAN: r0=254(x), r1=29(y), r2=47(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 29
LDI r2, 47
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
