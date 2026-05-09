; DESCRIPTION: Draws a blue rectangle at (139, 115) with width 83 and height 111.
; PLAN: r0=139(x), r1=115(y), r2=83(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 115
LDI r2, 83
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
