; DESCRIPTION: Draws a red rectangle at (93, 52) with width 36 and height 67.
; PLAN: r0=93(x), r1=52(y), r2=36(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 52
LDI r2, 36
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
