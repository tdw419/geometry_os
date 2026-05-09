; DESCRIPTION: Draws a red rectangle at (285, 52) with width 52 and height 116.
; PLAN: r0=285(x), r1=52(y), r2=52(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 52
LDI r2, 52
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
