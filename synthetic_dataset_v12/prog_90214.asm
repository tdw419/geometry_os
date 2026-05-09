; DESCRIPTION: Draws a white rectangle at (298, 106) with width 56 and height 88.
; PLAN: r0=298(x), r1=106(y), r2=56(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 106
LDI r2, 56
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
