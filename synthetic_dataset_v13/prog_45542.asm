; DESCRIPTION: Draws a red rectangle at (145, 137) with width 47 and height 53.
; PLAN: r0=145(x), r1=137(y), r2=47(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 137
LDI r2, 47
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
