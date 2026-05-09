; DESCRIPTION: Draws a green rectangle at (124, 149) with width 21 and height 89.
; PLAN: r0=124(x), r1=149(y), r2=21(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 149
LDI r2, 21
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
