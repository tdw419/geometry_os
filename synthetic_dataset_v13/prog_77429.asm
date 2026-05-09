; DESCRIPTION: Draws a green rectangle at (52, 10) with width 115 and height 86.
; PLAN: r0=52(x), r1=10(y), r2=115(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 10
LDI r2, 115
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
