; DESCRIPTION: Draws a green rectangle at (42, 6) with width 94 and height 89.
; PLAN: r0=42(x), r1=6(y), r2=94(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 6
LDI r2, 94
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
