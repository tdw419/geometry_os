; DESCRIPTION: Draws a blue rectangle at (335, 113) with width 68 and height 111.
; PLAN: r0=335(x), r1=113(y), r2=68(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 113
LDI r2, 68
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
