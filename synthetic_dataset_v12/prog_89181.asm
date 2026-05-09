; DESCRIPTION: Draws a red rectangle at (78, 89) with width 38 and height 72.
; PLAN: r0=78(x), r1=89(y), r2=38(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 89
LDI r2, 38
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
