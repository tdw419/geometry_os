; DESCRIPTION: Draws a white rectangle at (463, 146) with width 43 and height 88.
; PLAN: r0=463(x), r1=146(y), r2=43(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 146
LDI r2, 43
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
