; DESCRIPTION: Draws a blue rectangle at (286, 69) with width 55 and height 72.
; PLAN: r0=286(x), r1=69(y), r2=55(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 69
LDI r2, 55
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
