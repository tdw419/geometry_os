; DESCRIPTION: Draws a green rectangle at (30, 158) with width 120 and height 93.
; PLAN: r0=30(x), r1=158(y), r2=120(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 158
LDI r2, 120
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
