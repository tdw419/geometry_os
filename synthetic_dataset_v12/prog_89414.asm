; DESCRIPTION: Draws a blue rectangle at (38, 137) with width 24 and height 112.
; PLAN: r0=38(x), r1=137(y), r2=24(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 137
LDI r2, 24
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
