; DESCRIPTION: Draws a purple rectangle at (36, 62) with width 108 and height 120.
; PLAN: r0=36(x), r1=62(y), r2=108(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 62
LDI r2, 108
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
