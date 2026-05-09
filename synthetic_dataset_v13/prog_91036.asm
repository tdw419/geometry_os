; DESCRIPTION: Draws a magenta rectangle at (142, 146) with width 67 and height 30.
; PLAN: r0=142(x), r1=146(y), r2=67(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 146
LDI r2, 67
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
