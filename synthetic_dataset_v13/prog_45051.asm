; DESCRIPTION: Draws a red rectangle at (96, 169) with width 30 and height 30.
; PLAN: r0=96(x), r1=169(y), r2=30(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 169
LDI r2, 30
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
