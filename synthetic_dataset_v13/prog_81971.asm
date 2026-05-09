; DESCRIPTION: Draws a blue rectangle at (45, 72) with width 72 and height 87.
; PLAN: r0=45(x), r1=72(y), r2=72(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 72
LDI r2, 72
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
