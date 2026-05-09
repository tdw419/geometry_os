; DESCRIPTION: Draws a blue rectangle at (55, 121) with width 53 and height 109.
; PLAN: r0=55(x), r1=121(y), r2=53(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 121
LDI r2, 53
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
