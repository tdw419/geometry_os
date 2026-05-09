; DESCRIPTION: Draws a magenta rectangle at (330, 136) with width 120 and height 19.
; PLAN: r0=330(x), r1=136(y), r2=120(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 136
LDI r2, 120
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
