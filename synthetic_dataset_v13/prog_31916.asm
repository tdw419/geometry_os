; DESCRIPTION: Draws a purple rectangle at (29, 120) with width 48 and height 26.
; PLAN: r0=29(x), r1=120(y), r2=48(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 120
LDI r2, 48
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
