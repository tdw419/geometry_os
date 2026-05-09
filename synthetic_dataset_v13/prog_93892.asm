; DESCRIPTION: Draws a blue rectangle at (468, 191) with width 20 and height 47.
; PLAN: r0=468(x), r1=191(y), r2=20(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 191
LDI r2, 20
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
