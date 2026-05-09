; DESCRIPTION: Draws a green rectangle at (65, 116) with width 73 and height 116.
; PLAN: r0=65(x), r1=116(y), r2=73(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 116
LDI r2, 73
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
