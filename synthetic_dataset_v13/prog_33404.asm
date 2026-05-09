; DESCRIPTION: Draws a green rectangle at (355, 116) with width 79 and height 98.
; PLAN: r0=355(x), r1=116(y), r2=79(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 116
LDI r2, 79
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
