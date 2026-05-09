; DESCRIPTION: Draws a green rectangle at (251, 124) with width 78 and height 30.
; PLAN: r0=251(x), r1=124(y), r2=78(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 124
LDI r2, 78
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
