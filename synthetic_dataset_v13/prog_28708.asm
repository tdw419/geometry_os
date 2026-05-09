; DESCRIPTION: Draws a purple rectangle at (463, 32) with width 38 and height 113.
; PLAN: r0=463(x), r1=32(y), r2=38(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 32
LDI r2, 38
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
