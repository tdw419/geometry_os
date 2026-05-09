; DESCRIPTION: Draws a blue rectangle at (101, 59) with width 40 and height 77.
; PLAN: r0=101(x), r1=59(y), r2=40(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 59
LDI r2, 40
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
