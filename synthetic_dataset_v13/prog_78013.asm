; DESCRIPTION: Draws a blue rectangle at (315, 48) with width 70 and height 80.
; PLAN: r0=315(x), r1=48(y), r2=70(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 48
LDI r2, 70
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
