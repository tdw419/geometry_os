; DESCRIPTION: Draws a purple rectangle at (393, 70) with width 114 and height 65.
; PLAN: r0=393(x), r1=70(y), r2=114(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 70
LDI r2, 114
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
