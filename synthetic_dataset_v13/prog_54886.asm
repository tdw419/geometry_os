; DESCRIPTION: Draws a blue rectangle at (418, 2) with width 45 and height 80.
; PLAN: r0=418(x), r1=2(y), r2=45(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 2
LDI r2, 45
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
