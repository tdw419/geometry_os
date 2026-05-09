; DESCRIPTION: Draws a blue rectangle at (23, 5) with width 36 and height 105.
; PLAN: r0=23(x), r1=5(y), r2=36(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 5
LDI r2, 36
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
