; DESCRIPTION: Draws a purple rectangle at (123, 14) with width 46 and height 93.
; PLAN: r0=123(x), r1=14(y), r2=46(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 14
LDI r2, 46
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
