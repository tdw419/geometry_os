; DESCRIPTION: Draws a white rectangle at (363, 68) with width 56 and height 79.
; PLAN: r0=363(x), r1=68(y), r2=56(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 68
LDI r2, 56
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
