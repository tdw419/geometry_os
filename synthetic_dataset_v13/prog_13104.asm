; DESCRIPTION: Draws a green rectangle at (185, 93) with width 115 and height 100.
; PLAN: r0=185(x), r1=93(y), r2=115(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 93
LDI r2, 115
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
