; DESCRIPTION: Draws a blue rectangle at (397, 100) with width 17 and height 45.
; PLAN: r0=397(x), r1=100(y), r2=17(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 100
LDI r2, 17
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
