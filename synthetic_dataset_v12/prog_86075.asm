; DESCRIPTION: Draws a red rectangle at (68, 116) with width 35 and height 71.
; PLAN: r0=68(x), r1=116(y), r2=35(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 116
LDI r2, 35
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
