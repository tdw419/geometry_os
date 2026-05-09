; DESCRIPTION: Draws a blue rectangle at (258, 60) with width 34 and height 53.
; PLAN: r0=258(x), r1=60(y), r2=34(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 60
LDI r2, 34
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
