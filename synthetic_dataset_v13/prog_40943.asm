; DESCRIPTION: Draws a blue rectangle at (68, 2) with width 71 and height 107.
; PLAN: r0=68(x), r1=2(y), r2=71(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 2
LDI r2, 71
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
