; DESCRIPTION: Draws a green rectangle at (77, 21) with width 11 and height 90.
; PLAN: r0=77(x), r1=21(y), r2=11(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 21
LDI r2, 11
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
