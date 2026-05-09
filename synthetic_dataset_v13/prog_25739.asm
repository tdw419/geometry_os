; DESCRIPTION: Draws a white rectangle at (345, 52) with width 93 and height 51.
; PLAN: r0=345(x), r1=52(y), r2=93(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 52
LDI r2, 93
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
