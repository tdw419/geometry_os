; DESCRIPTION: Draws a blue rectangle at (299, 120) with width 56 and height 80.
; PLAN: r0=299(x), r1=120(y), r2=56(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 120
LDI r2, 56
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
