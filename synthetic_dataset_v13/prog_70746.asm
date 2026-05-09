; DESCRIPTION: Draws a white rectangle at (249, 55) with width 107 and height 115.
; PLAN: r0=249(x), r1=55(y), r2=107(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 55
LDI r2, 107
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
