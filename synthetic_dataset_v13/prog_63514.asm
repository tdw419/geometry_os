; DESCRIPTION: Draws a blue rectangle at (73, 74) with width 116 and height 13.
; PLAN: r0=73(x), r1=74(y), r2=116(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 74
LDI r2, 116
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
