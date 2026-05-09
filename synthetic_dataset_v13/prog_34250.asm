; DESCRIPTION: Draws a blue rectangle at (313, 71) with width 34 and height 84.
; PLAN: r0=313(x), r1=71(y), r2=34(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 71
LDI r2, 34
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
