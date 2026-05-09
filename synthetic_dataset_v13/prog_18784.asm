; DESCRIPTION: Draws a red rectangle at (223, 75) with width 72 and height 29.
; PLAN: r0=223(x), r1=75(y), r2=72(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 75
LDI r2, 72
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
