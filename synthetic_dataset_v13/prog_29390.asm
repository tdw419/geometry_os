; DESCRIPTION: Draws a blue rectangle at (319, 157) with width 98 and height 12.
; PLAN: r0=319(x), r1=157(y), r2=98(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 157
LDI r2, 98
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
