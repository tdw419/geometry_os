; DESCRIPTION: Draws a white rectangle at (345, 17) with width 89 and height 42.
; PLAN: r0=345(x), r1=17(y), r2=89(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 17
LDI r2, 89
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
