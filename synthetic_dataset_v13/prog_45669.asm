; DESCRIPTION: Draws a blue rectangle at (102, 78) with width 79 and height 96.
; PLAN: r0=102(x), r1=78(y), r2=79(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 78
LDI r2, 79
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
