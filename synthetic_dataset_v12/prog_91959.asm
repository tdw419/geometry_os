; DESCRIPTION: Draws a green rectangle at (100, 93) with width 30 and height 17.
; PLAN: r0=100(x), r1=93(y), r2=30(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 93
LDI r2, 30
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
