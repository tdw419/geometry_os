; DESCRIPTION: Draws a purple rectangle at (288, 50) with width 109 and height 99.
; PLAN: r0=288(x), r1=50(y), r2=109(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 50
LDI r2, 109
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
