; DESCRIPTION: Draws a purple rectangle at (172, 20) with width 47 and height 34.
; PLAN: r0=172(x), r1=20(y), r2=47(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 20
LDI r2, 47
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
