; DESCRIPTION: Draws a blue rectangle at (317, 77) with width 13 and height 64.
; PLAN: r0=317(x), r1=77(y), r2=13(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 77
LDI r2, 13
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
