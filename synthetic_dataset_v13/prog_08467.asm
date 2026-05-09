; DESCRIPTION: Draws a red rectangle at (134, 5) with width 71 and height 100.
; PLAN: r0=134(x), r1=5(y), r2=71(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 5
LDI r2, 71
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
