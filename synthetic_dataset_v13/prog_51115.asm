; DESCRIPTION: Draws a purple rectangle at (262, 62) with width 54 and height 85.
; PLAN: r0=262(x), r1=62(y), r2=54(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 62
LDI r2, 54
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
