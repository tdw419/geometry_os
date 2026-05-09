; DESCRIPTION: Draws a purple rectangle at (236, 148) with width 77 and height 10.
; PLAN: r0=236(x), r1=148(y), r2=77(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 148
LDI r2, 77
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
