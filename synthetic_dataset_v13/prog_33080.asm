; DESCRIPTION: Draws a blue rectangle at (350, 95) with width 111 and height 82.
; PLAN: r0=350(x), r1=95(y), r2=111(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 95
LDI r2, 111
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
