; DESCRIPTION: Draws a green rectangle at (180, 30) with width 111 and height 15.
; PLAN: r0=180(x), r1=30(y), r2=111(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 30
LDI r2, 111
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
