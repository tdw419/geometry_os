; DESCRIPTION: Draws a purple rectangle at (303, 150) with width 100 and height 92.
; PLAN: r0=303(x), r1=150(y), r2=100(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 150
LDI r2, 100
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
