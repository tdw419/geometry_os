; DESCRIPTION: Draws a red rectangle at (36, 56) with width 78 and height 56.
; PLAN: r0=36(x), r1=56(y), r2=78(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 56
LDI r2, 78
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
