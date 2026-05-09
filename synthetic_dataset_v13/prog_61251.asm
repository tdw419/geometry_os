; DESCRIPTION: Draws a red rectangle at (236, 36) with width 119 and height 100.
; PLAN: r0=236(x), r1=36(y), r2=119(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 36
LDI r2, 119
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
