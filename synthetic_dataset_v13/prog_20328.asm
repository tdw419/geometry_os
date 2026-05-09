; DESCRIPTION: Draws a purple rectangle at (169, 62) with width 32 and height 70.
; PLAN: r0=169(x), r1=62(y), r2=32(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 62
LDI r2, 32
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
