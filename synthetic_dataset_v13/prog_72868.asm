; DESCRIPTION: Draws a blue rectangle at (199, 175) with width 60 and height 36.
; PLAN: r0=199(x), r1=175(y), r2=60(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 175
LDI r2, 60
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
