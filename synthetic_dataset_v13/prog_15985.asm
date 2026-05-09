; DESCRIPTION: Draws a white rectangle at (83, 40) with width 90 and height 86.
; PLAN: r0=83(x), r1=40(y), r2=90(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 40
LDI r2, 90
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
