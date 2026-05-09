; DESCRIPTION: Draws a red rectangle at (140, 79) with width 12 and height 100.
; PLAN: r0=140(x), r1=79(y), r2=12(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 79
LDI r2, 12
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
