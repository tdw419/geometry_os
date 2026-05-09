; DESCRIPTION: Draws a purple rectangle at (6, 47) with width 103 and height 12.
; PLAN: r0=6(x), r1=47(y), r2=103(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 47
LDI r2, 103
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
