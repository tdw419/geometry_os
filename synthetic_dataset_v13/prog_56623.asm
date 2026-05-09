; DESCRIPTION: Draws a purple rectangle at (307, 56) with width 60 and height 68.
; PLAN: r0=307(x), r1=56(y), r2=60(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 56
LDI r2, 60
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
