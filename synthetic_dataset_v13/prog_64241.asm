; DESCRIPTION: Draws a white rectangle at (79, 65) with width 52 and height 72.
; PLAN: r0=79(x), r1=65(y), r2=52(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 65
LDI r2, 52
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
