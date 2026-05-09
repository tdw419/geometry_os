; DESCRIPTION: Draws a red rectangle at (312, 134) with width 83 and height 79.
; PLAN: r0=312(x), r1=134(y), r2=83(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 134
LDI r2, 83
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
