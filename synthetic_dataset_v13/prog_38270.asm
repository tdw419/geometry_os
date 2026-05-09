; DESCRIPTION: Draws a purple rectangle at (50, 199) with width 14 and height 10.
; PLAN: r0=50(x), r1=199(y), r2=14(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 199
LDI r2, 14
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
