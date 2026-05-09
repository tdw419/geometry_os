; DESCRIPTION: Draws a blue rectangle at (89, 177) with width 61 and height 23.
; PLAN: r0=89(x), r1=177(y), r2=61(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 177
LDI r2, 61
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
