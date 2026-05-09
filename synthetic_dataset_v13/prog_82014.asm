; DESCRIPTION: Draws a purple rectangle at (383, 50) with width 72 and height 113.
; PLAN: r0=383(x), r1=50(y), r2=72(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 50
LDI r2, 72
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
