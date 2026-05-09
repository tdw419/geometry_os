; DESCRIPTION: Draws a white rectangle at (23, 80) with width 96 and height 70.
; PLAN: r0=23(x), r1=80(y), r2=96(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 80
LDI r2, 96
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
