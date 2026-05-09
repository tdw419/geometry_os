; DESCRIPTION: Draws a green rectangle at (45, 49) with width 18 and height 53.
; PLAN: r0=45(x), r1=49(y), r2=18(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 49
LDI r2, 18
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
