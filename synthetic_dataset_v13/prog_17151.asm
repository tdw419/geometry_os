; DESCRIPTION: Draws a blue rectangle at (7, 124) with width 89 and height 61.
; PLAN: r0=7(x), r1=124(y), r2=89(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 124
LDI r2, 89
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
