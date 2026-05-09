; DESCRIPTION: Draws a white rectangle at (366, 110) with width 111 and height 105.
; PLAN: r0=366(x), r1=110(y), r2=111(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 110
LDI r2, 111
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
