; DESCRIPTION: Draws a blue rectangle at (366, 93) with width 102 and height 109.
; PLAN: r0=366(x), r1=93(y), r2=102(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 93
LDI r2, 102
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
