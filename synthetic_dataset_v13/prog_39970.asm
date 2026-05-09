; DESCRIPTION: Draws a magenta rectangle at (452, 73) with width 33 and height 67.
; PLAN: r0=452(x), r1=73(y), r2=33(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 73
LDI r2, 33
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
