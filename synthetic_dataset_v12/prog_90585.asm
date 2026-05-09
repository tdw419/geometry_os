; DESCRIPTION: Draws a green rectangle at (93, 135) with width 57 and height 18.
; PLAN: r0=93(x), r1=135(y), r2=57(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 135
LDI r2, 57
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
