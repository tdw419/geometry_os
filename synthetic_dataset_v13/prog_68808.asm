; DESCRIPTION: Draws a green rectangle at (138, 177) with width 98 and height 59.
; PLAN: r0=138(x), r1=177(y), r2=98(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 177
LDI r2, 98
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
