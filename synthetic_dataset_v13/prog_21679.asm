; DESCRIPTION: Draws a green rectangle at (79, 115) with width 77 and height 108.
; PLAN: r0=79(x), r1=115(y), r2=77(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 115
LDI r2, 77
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
