; DESCRIPTION: Draws a blue rectangle at (183, 78) with width 18 and height 48.
; PLAN: r0=183(x), r1=78(y), r2=18(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 78
LDI r2, 18
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
