; DESCRIPTION: Draws a blue rectangle at (397, 175) with width 47 and height 50.
; PLAN: r0=397(x), r1=175(y), r2=47(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 175
LDI r2, 47
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
