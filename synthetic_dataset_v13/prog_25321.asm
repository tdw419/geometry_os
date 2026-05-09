; DESCRIPTION: Draws a green rectangle at (356, 52) with width 71 and height 69.
; PLAN: r0=356(x), r1=52(y), r2=71(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 52
LDI r2, 71
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
