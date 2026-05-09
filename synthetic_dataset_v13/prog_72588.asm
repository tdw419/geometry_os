; DESCRIPTION: Draws a black rectangle at (95, 33) with width 115 and height 20.
; PLAN: r0=95(x), r1=33(y), r2=115(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 33
LDI r2, 115
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
