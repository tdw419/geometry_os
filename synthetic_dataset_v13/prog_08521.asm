; DESCRIPTION: Draws a green rectangle at (93, 134) with width 116 and height 28.
; PLAN: r0=93(x), r1=134(y), r2=116(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 134
LDI r2, 116
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
