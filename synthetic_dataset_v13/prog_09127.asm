; DESCRIPTION: Draws a white rectangle at (141, 185) with width 74 and height 55.
; PLAN: r0=141(x), r1=185(y), r2=74(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 185
LDI r2, 74
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
