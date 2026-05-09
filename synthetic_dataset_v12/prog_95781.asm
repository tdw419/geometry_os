; DESCRIPTION: Draws a white rectangle at (250, 145) with width 45 and height 15.
; PLAN: r0=250(x), r1=145(y), r2=45(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 145
LDI r2, 45
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
