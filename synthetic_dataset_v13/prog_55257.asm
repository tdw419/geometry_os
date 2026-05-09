; DESCRIPTION: Draws a blue rectangle at (199, 14) with width 39 and height 64.
; PLAN: r0=199(x), r1=14(y), r2=39(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 14
LDI r2, 39
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
