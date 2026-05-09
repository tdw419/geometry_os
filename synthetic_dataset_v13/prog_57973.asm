; DESCRIPTION: Draws a purple rectangle at (103, 9) with width 117 and height 108.
; PLAN: r0=103(x), r1=9(y), r2=117(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 9
LDI r2, 117
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
