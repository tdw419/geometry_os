; DESCRIPTION: Draws a white rectangle at (135, 137) with width 33 and height 83.
; PLAN: r0=135(x), r1=137(y), r2=33(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 137
LDI r2, 33
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
