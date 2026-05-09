; DESCRIPTION: Draws a red rectangle at (285, 30) with width 76 and height 26.
; PLAN: r0=285(x), r1=30(y), r2=76(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 30
LDI r2, 76
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
