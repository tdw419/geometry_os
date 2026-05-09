; DESCRIPTION: Draws a white rectangle at (201, 60) with width 30 and height 91.
; PLAN: r0=201(x), r1=60(y), r2=30(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 60
LDI r2, 30
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
