; DESCRIPTION: Draws a purple rectangle at (141, 171) with width 117 and height 73.
; PLAN: r0=141(x), r1=171(y), r2=117(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 171
LDI r2, 117
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
