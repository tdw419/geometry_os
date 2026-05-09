; DESCRIPTION: Draws a yellow rectangle at (95, 115) with width 87 and height 49.
; PLAN: r0=95(x), r1=115(y), r2=87(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 115
LDI r2, 87
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
