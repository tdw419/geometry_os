; DESCRIPTION: Draws a purple rectangle at (393, 199) with width 60 and height 11.
; PLAN: r0=393(x), r1=199(y), r2=60(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 199
LDI r2, 60
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
