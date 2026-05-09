; DESCRIPTION: Draws a blue rectangle at (98, 106) with width 45 and height 49.
; PLAN: r0=98(x), r1=106(y), r2=45(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 106
LDI r2, 45
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
