; DESCRIPTION: Draws a white rectangle at (345, 119) with width 49 and height 80.
; PLAN: r0=345(x), r1=119(y), r2=49(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 119
LDI r2, 49
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
