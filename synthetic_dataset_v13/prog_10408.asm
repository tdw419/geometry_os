; DESCRIPTION: Draws a green rectangle at (405, 114) with width 51 and height 82.
; PLAN: r0=405(x), r1=114(y), r2=51(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 114
LDI r2, 51
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
