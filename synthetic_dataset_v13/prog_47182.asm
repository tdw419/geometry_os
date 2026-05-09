; DESCRIPTION: Draws a purple rectangle at (270, 189) with width 102 and height 59.
; PLAN: r0=270(x), r1=189(y), r2=102(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 189
LDI r2, 102
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
