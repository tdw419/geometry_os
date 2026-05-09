; DESCRIPTION: Draws a blue rectangle at (30, 146) with width 81 and height 55.
; PLAN: r0=30(x), r1=146(y), r2=81(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 146
LDI r2, 81
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
