; DESCRIPTION: Draws a purple rectangle at (255, 92) with width 10 and height 77.
; PLAN: r0=255(x), r1=92(y), r2=10(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 92
LDI r2, 10
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
