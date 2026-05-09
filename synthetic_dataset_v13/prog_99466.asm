; DESCRIPTION: Draws a blue rectangle at (5, 194) with width 59 and height 23.
; PLAN: r0=5(x), r1=194(y), r2=59(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 194
LDI r2, 59
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
