; DESCRIPTION: Draws a purple rectangle at (423, 26) with width 48 and height 113.
; PLAN: r0=423(x), r1=26(y), r2=48(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 26
LDI r2, 48
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
