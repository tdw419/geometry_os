; DESCRIPTION: Draws a blue rectangle at (149, 124) with width 90 and height 52.
; PLAN: r0=149(x), r1=124(y), r2=90(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 124
LDI r2, 90
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
