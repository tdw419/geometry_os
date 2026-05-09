; DESCRIPTION: Draws a green rectangle at (93, 81) with width 47 and height 76.
; PLAN: r0=93(x), r1=81(y), r2=47(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 81
LDI r2, 47
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
