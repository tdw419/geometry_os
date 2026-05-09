; DESCRIPTION: Draws a blue rectangle at (124, 177) with width 60 and height 23.
; PLAN: r0=124(x), r1=177(y), r2=60(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 177
LDI r2, 60
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
