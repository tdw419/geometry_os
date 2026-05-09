; DESCRIPTION: Draws a white rectangle at (21, 93) with width 51 and height 99.
; PLAN: r0=21(x), r1=93(y), r2=51(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 93
LDI r2, 51
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
