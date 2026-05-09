; DESCRIPTION: Draws a blue rectangle at (53, 165) with width 34 and height 46.
; PLAN: r0=53(x), r1=165(y), r2=34(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 165
LDI r2, 34
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
