; DESCRIPTION: Draws a black rectangle at (60, 124) with width 29 and height 106.
; PLAN: r0=60(x), r1=124(y), r2=29(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 124
LDI r2, 29
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
