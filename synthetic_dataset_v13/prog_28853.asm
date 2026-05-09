; DESCRIPTION: Draws a white rectangle at (9, 78) with width 74 and height 117.
; PLAN: r0=9(x), r1=78(y), r2=74(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 78
LDI r2, 74
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
