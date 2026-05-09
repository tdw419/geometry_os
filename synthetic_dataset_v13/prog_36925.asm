; DESCRIPTION: Draws a blue rectangle at (417, 220) with width 70 and height 33.
; PLAN: r0=417(x), r1=220(y), r2=70(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 220
LDI r2, 70
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
