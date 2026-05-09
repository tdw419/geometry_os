; DESCRIPTION: Draws a green rectangle at (283, 117) with width 93 and height 71.
; PLAN: r0=283(x), r1=117(y), r2=93(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 117
LDI r2, 93
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
