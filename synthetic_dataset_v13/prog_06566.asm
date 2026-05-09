; DESCRIPTION: Draws a blue rectangle at (305, 35) with width 44 and height 43.
; PLAN: r0=305(x), r1=35(y), r2=44(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 35
LDI r2, 44
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
