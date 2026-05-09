; DESCRIPTION: Draws a yellow rectangle at (285, 36) with width 31 and height 36.
; PLAN: r0=285(x), r1=36(y), r2=31(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 36
LDI r2, 31
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
