; DESCRIPTION: Draws a blue rectangle at (324, 4) with width 112 and height 58.
; PLAN: r0=324(x), r1=4(y), r2=112(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 4
LDI r2, 112
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
