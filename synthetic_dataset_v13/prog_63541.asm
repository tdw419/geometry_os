; DESCRIPTION: Draws a green rectangle at (426, 65) with width 47 and height 112.
; PLAN: r0=426(x), r1=65(y), r2=47(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 65
LDI r2, 47
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
