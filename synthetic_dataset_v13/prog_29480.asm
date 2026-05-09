; DESCRIPTION: Draws a yellow rectangle at (286, 27) with width 102 and height 89.
; PLAN: r0=286(x), r1=27(y), r2=102(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 27
LDI r2, 102
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
