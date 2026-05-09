; DESCRIPTION: Draws a blue rectangle at (184, 121) with width 27 and height 66.
; PLAN: r0=184(x), r1=121(y), r2=27(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 121
LDI r2, 27
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
