; DESCRIPTION: Draws a green rectangle at (52, 77) with width 108 and height 82.
; PLAN: r0=52(x), r1=77(y), r2=108(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 77
LDI r2, 108
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
