; DESCRIPTION: Draws a black rectangle at (399, 70) with width 59 and height 119.
; PLAN: r0=399(x), r1=70(y), r2=59(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 70
LDI r2, 59
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
