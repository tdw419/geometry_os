; DESCRIPTION: Draws a purple rectangle at (131, 221) with width 19 and height 10.
; PLAN: r0=131(x), r1=221(y), r2=19(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 221
LDI r2, 19
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
