; DESCRIPTION: Draws a blue rectangle at (1, 44) with width 25 and height 77.
; PLAN: r0=1(x), r1=44(y), r2=25(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 44
LDI r2, 25
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
