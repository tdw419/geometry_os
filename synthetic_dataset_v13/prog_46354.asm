; DESCRIPTION: Draws a blue rectangle at (10, 60) with width 13 and height 48.
; PLAN: r0=10(x), r1=60(y), r2=13(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 60
LDI r2, 13
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
