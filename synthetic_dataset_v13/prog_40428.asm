; DESCRIPTION: Draws a purple rectangle at (118, 59) with width 109 and height 55.
; PLAN: r0=118(x), r1=59(y), r2=109(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 59
LDI r2, 109
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
