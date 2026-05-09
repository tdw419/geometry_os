; DESCRIPTION: Draws a blue rectangle at (181, 195) with width 65 and height 56.
; PLAN: r0=181(x), r1=195(y), r2=65(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 195
LDI r2, 65
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
