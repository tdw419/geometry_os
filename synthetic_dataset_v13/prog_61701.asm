; DESCRIPTION: Draws a purple rectangle at (229, 92) with width 117 and height 34.
; PLAN: r0=229(x), r1=92(y), r2=117(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 92
LDI r2, 117
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
