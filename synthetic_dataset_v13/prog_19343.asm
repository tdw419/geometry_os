; DESCRIPTION: Draws a green rectangle at (210, 27) with width 89 and height 105.
; PLAN: r0=210(x), r1=27(y), r2=89(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 27
LDI r2, 89
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
