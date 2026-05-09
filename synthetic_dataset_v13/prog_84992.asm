; DESCRIPTION: Draws a white rectangle at (311, 197) with width 83 and height 51.
; PLAN: r0=311(x), r1=197(y), r2=83(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 197
LDI r2, 83
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
