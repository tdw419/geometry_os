; DESCRIPTION: Draws a blue rectangle at (456, 10) with width 53 and height 98.
; PLAN: r0=456(x), r1=10(y), r2=53(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 10
LDI r2, 53
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
