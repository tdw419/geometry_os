; DESCRIPTION: Draws a blue rectangle at (300, 121) with width 16 and height 119.
; PLAN: r0=300(x), r1=121(y), r2=16(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 121
LDI r2, 16
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
