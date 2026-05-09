; DESCRIPTION: Draws a white rectangle at (69, 121) with width 37 and height 90.
; PLAN: r0=69(x), r1=121(y), r2=37(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 121
LDI r2, 37
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
