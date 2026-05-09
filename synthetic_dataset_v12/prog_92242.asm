; DESCRIPTION: Draws a green rectangle at (94, 124) with width 65 and height 55.
; PLAN: r0=94(x), r1=124(y), r2=65(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 124
LDI r2, 65
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
