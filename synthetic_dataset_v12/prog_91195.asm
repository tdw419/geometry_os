; DESCRIPTION: Draws a red rectangle at (167, 145) with width 80 and height 79.
; PLAN: r0=167(x), r1=145(y), r2=80(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 145
LDI r2, 80
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
