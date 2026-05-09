; DESCRIPTION: Draws a blue rectangle at (433, 211) with width 56 and height 24.
; PLAN: r0=433(x), r1=211(y), r2=56(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 211
LDI r2, 56
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
