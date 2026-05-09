; DESCRIPTION: Draws a black rectangle at (172, 135) with width 90 and height 38.
; PLAN: r0=172(x), r1=135(y), r2=90(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 135
LDI r2, 90
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
