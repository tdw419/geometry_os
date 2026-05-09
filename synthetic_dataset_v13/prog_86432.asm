; DESCRIPTION: Draws a green rectangle at (286, 133) with width 49 and height 51.
; PLAN: r0=286(x), r1=133(y), r2=49(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 133
LDI r2, 49
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
