; DESCRIPTION: Draws a blue rectangle at (162, 0) with width 69 and height 64.
; PLAN: r0=162(x), r1=0(y), r2=69(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 0
LDI r2, 69
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
