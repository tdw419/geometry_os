; DESCRIPTION: Draws a purple rectangle at (308, 74) with width 14 and height 111.
; PLAN: r0=308(x), r1=74(y), r2=14(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 74
LDI r2, 14
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
