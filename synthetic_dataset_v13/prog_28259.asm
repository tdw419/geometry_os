; DESCRIPTION: Draws a white rectangle at (306, 87) with width 55 and height 105.
; PLAN: r0=306(x), r1=87(y), r2=55(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 87
LDI r2, 55
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
