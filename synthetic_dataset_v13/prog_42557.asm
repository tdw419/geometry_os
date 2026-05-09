; DESCRIPTION: Draws a green rectangle at (285, 123) with width 76 and height 30.
; PLAN: r0=285(x), r1=123(y), r2=76(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 123
LDI r2, 76
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
