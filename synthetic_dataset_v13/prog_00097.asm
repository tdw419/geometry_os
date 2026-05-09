; DESCRIPTION: Draws a red rectangle at (58, 92) with width 26 and height 67.
; PLAN: r0=58(x), r1=92(y), r2=26(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 92
LDI r2, 26
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
