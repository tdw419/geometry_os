; DESCRIPTION: Draws a purple rectangle at (117, 27) with width 89 and height 116.
; PLAN: r0=117(x), r1=27(y), r2=89(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 27
LDI r2, 89
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
