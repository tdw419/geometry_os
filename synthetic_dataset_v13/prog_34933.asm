; DESCRIPTION: Draws a white rectangle at (230, 172) with width 117 and height 54.
; PLAN: r0=230(x), r1=172(y), r2=117(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 172
LDI r2, 117
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
