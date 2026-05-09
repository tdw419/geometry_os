; DESCRIPTION: Draws a blue rectangle at (106, 135) with width 77 and height 46.
; PLAN: r0=106(x), r1=135(y), r2=77(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 135
LDI r2, 77
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
