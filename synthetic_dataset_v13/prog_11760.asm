; DESCRIPTION: Draws a purple rectangle at (304, 121) with width 117 and height 52.
; PLAN: r0=304(x), r1=121(y), r2=117(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 121
LDI r2, 117
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
