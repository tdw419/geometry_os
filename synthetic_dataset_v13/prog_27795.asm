; DESCRIPTION: Draws a white rectangle at (194, 68) with width 90 and height 117.
; PLAN: r0=194(x), r1=68(y), r2=90(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 68
LDI r2, 90
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
