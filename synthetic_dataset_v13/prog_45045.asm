; DESCRIPTION: Draws a purple rectangle at (412, 131) with width 62 and height 117.
; PLAN: r0=412(x), r1=131(y), r2=62(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 131
LDI r2, 62
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
