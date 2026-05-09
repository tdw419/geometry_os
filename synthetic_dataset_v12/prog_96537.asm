; DESCRIPTION: Draws a purple rectangle at (123, 7) with width 70 and height 83.
; PLAN: r0=123(x), r1=7(y), r2=70(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 7
LDI r2, 70
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
