; DESCRIPTION: Draws a white rectangle at (219, 75) with width 93 and height 46.
; PLAN: r0=219(x), r1=75(y), r2=93(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 75
LDI r2, 93
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
