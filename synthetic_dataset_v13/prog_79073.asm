; DESCRIPTION: Draws a blue rectangle at (7, 72) with width 34 and height 116.
; PLAN: r0=7(x), r1=72(y), r2=34(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 72
LDI r2, 34
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
