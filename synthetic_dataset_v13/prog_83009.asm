; DESCRIPTION: Draws a yellow rectangle at (415, 70) with width 73 and height 106.
; PLAN: r0=415(x), r1=70(y), r2=73(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 70
LDI r2, 73
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
