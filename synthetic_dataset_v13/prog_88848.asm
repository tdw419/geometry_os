; DESCRIPTION: Draws a white rectangle at (141, 122) with width 49 and height 79.
; PLAN: r0=141(x), r1=122(y), r2=49(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 122
LDI r2, 49
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
