; DESCRIPTION: Draws a yellow rectangle at (165, 78) with width 105 and height 115.
; PLAN: r0=165(x), r1=78(y), r2=105(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 78
LDI r2, 105
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
