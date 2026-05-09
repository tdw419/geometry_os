; DESCRIPTION: Draws a red rectangle at (121, 92) with width 67 and height 81.
; PLAN: r0=121(x), r1=92(y), r2=67(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 92
LDI r2, 67
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
