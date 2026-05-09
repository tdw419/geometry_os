; DESCRIPTION: Draws a blue rectangle at (255, 6) with width 92 and height 13.
; PLAN: r0=255(x), r1=6(y), r2=92(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 6
LDI r2, 92
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
