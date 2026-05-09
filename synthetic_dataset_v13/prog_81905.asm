; DESCRIPTION: Draws a blue rectangle at (450, 109) with width 19 and height 94.
; PLAN: r0=450(x), r1=109(y), r2=19(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 109
LDI r2, 19
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
