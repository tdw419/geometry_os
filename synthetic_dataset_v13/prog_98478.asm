; DESCRIPTION: Draws a green rectangle at (123, 119) with width 71 and height 116.
; PLAN: r0=123(x), r1=119(y), r2=71(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 119
LDI r2, 71
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
