; DESCRIPTION: Draws a black rectangle at (119, 180) with width 98 and height 47.
; PLAN: r0=119(x), r1=180(y), r2=98(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 180
LDI r2, 98
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
