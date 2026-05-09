; DESCRIPTION: Draws a white rectangle at (412, 93) with width 100 and height 115.
; PLAN: r0=412(x), r1=93(y), r2=100(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 93
LDI r2, 100
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
