; DESCRIPTION: Draws a red rectangle at (114, 116) with width 54 and height 78.
; PLAN: r0=114(x), r1=116(y), r2=54(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 116
LDI r2, 54
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
