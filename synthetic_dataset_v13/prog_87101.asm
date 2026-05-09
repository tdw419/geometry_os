; DESCRIPTION: Draws a blue rectangle at (82, 132) with width 84 and height 111.
; PLAN: r0=82(x), r1=132(y), r2=84(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 132
LDI r2, 84
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
