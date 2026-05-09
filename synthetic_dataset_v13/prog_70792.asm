; DESCRIPTION: Draws a purple rectangle at (69, 11) with width 64 and height 46.
; PLAN: r0=69(x), r1=11(y), r2=64(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 11
LDI r2, 64
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
