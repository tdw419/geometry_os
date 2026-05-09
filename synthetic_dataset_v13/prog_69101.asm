; DESCRIPTION: Draws a black rectangle at (413, 25) with width 75 and height 88.
; PLAN: r0=413(x), r1=25(y), r2=75(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 25
LDI r2, 75
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
