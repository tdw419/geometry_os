; DESCRIPTION: Draws a green rectangle at (310, 36) with width 118 and height 42.
; PLAN: r0=310(x), r1=36(y), r2=118(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 36
LDI r2, 118
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
