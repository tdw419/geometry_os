; DESCRIPTION: Draws a green rectangle at (246, 2) with width 102 and height 116.
; PLAN: r0=246(x), r1=2(y), r2=102(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 2
LDI r2, 102
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
