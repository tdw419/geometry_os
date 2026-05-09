; DESCRIPTION: Draws a magenta rectangle at (278, 179) with width 45 and height 67.
; PLAN: r0=278(x), r1=179(y), r2=45(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 179
LDI r2, 45
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
