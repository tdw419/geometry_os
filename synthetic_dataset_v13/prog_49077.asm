; DESCRIPTION: Draws a white rectangle at (80, 3) with width 110 and height 86.
; PLAN: r0=80(x), r1=3(y), r2=110(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 3
LDI r2, 110
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
