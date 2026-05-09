; DESCRIPTION: Draws a magenta rectangle at (328, 173) with width 15 and height 19.
; PLAN: r0=328(x), r1=173(y), r2=15(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 173
LDI r2, 15
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
