; DESCRIPTION: Draws a blue rectangle at (351, 4) with width 120 and height 59.
; PLAN: r0=351(x), r1=4(y), r2=120(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 4
LDI r2, 120
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
