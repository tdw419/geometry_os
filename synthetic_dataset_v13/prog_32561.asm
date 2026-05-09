; DESCRIPTION: Draws a white rectangle at (69, 110) with width 11 and height 93.
; PLAN: r0=69(x), r1=110(y), r2=11(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 110
LDI r2, 11
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
