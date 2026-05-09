; DESCRIPTION: Draws a blue rectangle at (183, 63) with width 93 and height 65.
; PLAN: r0=183(x), r1=63(y), r2=93(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 63
LDI r2, 93
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
