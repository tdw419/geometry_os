; DESCRIPTION: Draws a blue rectangle at (454, 191) with width 40 and height 40.
; PLAN: r0=454(x), r1=191(y), r2=40(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 191
LDI r2, 40
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
