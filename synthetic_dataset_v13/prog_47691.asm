; DESCRIPTION: Draws a blue rectangle at (127, 140) with width 28 and height 85.
; PLAN: r0=127(x), r1=140(y), r2=28(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 140
LDI r2, 28
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
