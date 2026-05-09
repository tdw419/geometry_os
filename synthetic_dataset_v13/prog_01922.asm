; DESCRIPTION: Draws a red rectangle at (251, 88) with width 15 and height 16.
; PLAN: r0=251(x), r1=88(y), r2=15(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 88
LDI r2, 15
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
