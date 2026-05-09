; DESCRIPTION: Draws a purple rectangle at (247, 100) with width 59 and height 112.
; PLAN: r0=247(x), r1=100(y), r2=59(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 100
LDI r2, 59
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
