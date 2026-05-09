; DESCRIPTION: Draws a red rectangle at (428, 105) with width 17 and height 119.
; PLAN: r0=428(x), r1=105(y), r2=17(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 105
LDI r2, 17
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
