; DESCRIPTION: Draws a black rectangle at (360, 71) with width 73 and height 53.
; PLAN: r0=360(x), r1=71(y), r2=73(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 71
LDI r2, 73
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
