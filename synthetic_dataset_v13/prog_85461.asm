; DESCRIPTION: Draws a magenta rectangle at (237, 159) with width 13 and height 76.
; PLAN: r0=237(x), r1=159(y), r2=13(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 159
LDI r2, 13
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
