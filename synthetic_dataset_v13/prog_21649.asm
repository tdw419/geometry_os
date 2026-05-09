; DESCRIPTION: Draws a blue rectangle at (69, 61) with width 61 and height 87.
; PLAN: r0=69(x), r1=61(y), r2=61(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 61
LDI r2, 61
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
