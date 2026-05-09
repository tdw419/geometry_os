; DESCRIPTION: Draws a blue rectangle at (160, 134) with width 53 and height 78.
; PLAN: r0=160(x), r1=134(y), r2=53(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 134
LDI r2, 53
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
