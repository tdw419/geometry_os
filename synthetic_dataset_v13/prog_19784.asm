; DESCRIPTION: Draws a blue rectangle at (338, 18) with width 91 and height 48.
; PLAN: r0=338(x), r1=18(y), r2=91(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 18
LDI r2, 91
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
