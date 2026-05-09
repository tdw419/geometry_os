; DESCRIPTION: Draws a blue rectangle at (273, 5) with width 56 and height 39.
; PLAN: r0=273(x), r1=5(y), r2=56(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 5
LDI r2, 56
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
