; DESCRIPTION: Draws a magenta rectangle at (251, 41) with width 22 and height 64.
; PLAN: r0=251(x), r1=41(y), r2=22(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 41
LDI r2, 22
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
