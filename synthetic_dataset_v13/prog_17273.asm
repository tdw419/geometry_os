; DESCRIPTION: Draws a purple rectangle at (90, 124) with width 12 and height 45.
; PLAN: r0=90(x), r1=124(y), r2=12(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 124
LDI r2, 12
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
