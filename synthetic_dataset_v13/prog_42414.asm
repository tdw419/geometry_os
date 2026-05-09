; DESCRIPTION: Draws a green rectangle at (388, 81) with width 32 and height 51.
; PLAN: r0=388(x), r1=81(y), r2=32(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 81
LDI r2, 32
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
