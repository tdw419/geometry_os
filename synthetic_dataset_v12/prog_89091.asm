; DESCRIPTION: Draws a blue rectangle at (286, 116) with width 49 and height 77.
; PLAN: r0=286(x), r1=116(y), r2=49(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 116
LDI r2, 49
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
