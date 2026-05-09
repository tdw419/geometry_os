; DESCRIPTION: Draws a white rectangle at (357, 80) with width 117 and height 65.
; PLAN: r0=357(x), r1=80(y), r2=117(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 80
LDI r2, 117
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
