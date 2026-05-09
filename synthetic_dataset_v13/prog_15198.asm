; DESCRIPTION: Draws a red rectangle at (134, 34) with width 34 and height 65.
; PLAN: r0=134(x), r1=34(y), r2=34(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 34
LDI r2, 34
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
