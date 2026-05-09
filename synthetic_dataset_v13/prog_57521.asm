; DESCRIPTION: Draws a blue rectangle at (433, 44) with width 13 and height 18.
; PLAN: r0=433(x), r1=44(y), r2=13(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 44
LDI r2, 13
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
