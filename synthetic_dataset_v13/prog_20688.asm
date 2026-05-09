; DESCRIPTION: Draws a yellow rectangle at (125, 73) with width 53 and height 84.
; PLAN: r0=125(x), r1=73(y), r2=53(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 73
LDI r2, 53
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
