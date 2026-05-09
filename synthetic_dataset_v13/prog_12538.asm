; DESCRIPTION: Draws a white rectangle at (39, 90) with width 95 and height 69.
; PLAN: r0=39(x), r1=90(y), r2=95(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 90
LDI r2, 95
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
