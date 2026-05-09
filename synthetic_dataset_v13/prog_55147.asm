; DESCRIPTION: Draws a red rectangle at (160, 52) with width 74 and height 92.
; PLAN: r0=160(x), r1=52(y), r2=74(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 52
LDI r2, 74
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
