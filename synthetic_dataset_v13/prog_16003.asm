; DESCRIPTION: Draws a black rectangle at (100, 2) with width 95 and height 23.
; PLAN: r0=100(x), r1=2(y), r2=95(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 2
LDI r2, 95
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
