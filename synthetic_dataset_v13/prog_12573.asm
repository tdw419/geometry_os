; DESCRIPTION: Draws a red rectangle at (113, 101) with width 68 and height 94.
; PLAN: r0=113(x), r1=101(y), r2=68(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 101
LDI r2, 68
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
