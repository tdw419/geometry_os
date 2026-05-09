; DESCRIPTION: Draws a white rectangle at (207, 50) with width 80 and height 26.
; PLAN: r0=207(x), r1=50(y), r2=80(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 50
LDI r2, 80
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
