; DESCRIPTION: Draws a red rectangle at (2, 137) with width 91 and height 70.
; PLAN: r0=2(x), r1=137(y), r2=91(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 137
LDI r2, 91
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
