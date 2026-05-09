; DESCRIPTION: Draws a blue rectangle at (7, 2) with width 10 and height 57.
; PLAN: r0=7(x), r1=2(y), r2=10(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 2
LDI r2, 10
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
