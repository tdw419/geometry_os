; DESCRIPTION: Draws a green rectangle at (78, 2) with width 59 and height 30.
; PLAN: r0=78(x), r1=2(y), r2=59(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 2
LDI r2, 59
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
