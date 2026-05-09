; DESCRIPTION: Draws a blue rectangle at (335, 240) with width 77 and height 13.
; PLAN: r0=335(x), r1=240(y), r2=77(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 240
LDI r2, 77
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
