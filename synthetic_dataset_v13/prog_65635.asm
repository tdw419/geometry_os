; DESCRIPTION: Draws a black rectangle at (103, 100) with width 52 and height 85.
; PLAN: r0=103(x), r1=100(y), r2=52(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 100
LDI r2, 52
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
