; DESCRIPTION: Draws a green rectangle at (358, 108) with width 30 and height 77.
; PLAN: r0=358(x), r1=108(y), r2=30(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 108
LDI r2, 30
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
