; DESCRIPTION: Draws a white rectangle at (22, 106) with width 65 and height 104.
; PLAN: r0=22(x), r1=106(y), r2=65(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 106
LDI r2, 65
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
