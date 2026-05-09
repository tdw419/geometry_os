; DESCRIPTION: Draws a blue rectangle at (285, 157) with width 59 and height 30.
; PLAN: r0=285(x), r1=157(y), r2=59(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 157
LDI r2, 59
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
