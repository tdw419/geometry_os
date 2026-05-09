; DESCRIPTION: Draws a red rectangle at (314, 28) with width 34 and height 101.
; PLAN: r0=314(x), r1=28(y), r2=34(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 28
LDI r2, 34
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
