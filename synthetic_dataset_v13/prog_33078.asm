; DESCRIPTION: Draws a red rectangle at (251, 123) with width 38 and height 52.
; PLAN: r0=251(x), r1=123(y), r2=38(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 123
LDI r2, 38
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
