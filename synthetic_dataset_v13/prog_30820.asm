; DESCRIPTION: Draws a white rectangle at (413, 145) with width 13 and height 80.
; PLAN: r0=413(x), r1=145(y), r2=13(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 145
LDI r2, 13
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
