; DESCRIPTION: Draws a green rectangle at (452, 103) with width 55 and height 52.
; PLAN: r0=452(x), r1=103(y), r2=55(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 103
LDI r2, 55
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
