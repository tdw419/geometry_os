; DESCRIPTION: Draws a magenta rectangle at (313, 107) with width 96 and height 36.
; PLAN: r0=313(x), r1=107(y), r2=96(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 107
LDI r2, 96
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
