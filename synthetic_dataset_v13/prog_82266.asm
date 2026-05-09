; DESCRIPTION: Draws a red rectangle at (108, 137) with width 100 and height 18.
; PLAN: r0=108(x), r1=137(y), r2=100(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 137
LDI r2, 100
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
