; DESCRIPTION: Draws a purple rectangle at (360, 139) with width 77 and height 47.
; PLAN: r0=360(x), r1=139(y), r2=77(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 139
LDI r2, 77
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
