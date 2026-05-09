; DESCRIPTION: Draws a yellow rectangle at (396, 27) with width 89 and height 11.
; PLAN: r0=396(x), r1=27(y), r2=89(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 27
LDI r2, 89
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
