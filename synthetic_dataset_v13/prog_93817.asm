; DESCRIPTION: Draws a red rectangle at (0, 48) with width 114 and height 118.
; PLAN: r0=0(x), r1=48(y), r2=114(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 48
LDI r2, 114
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
