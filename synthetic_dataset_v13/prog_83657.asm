; DESCRIPTION: Draws a yellow rectangle at (23, 89) with width 68 and height 51.
; PLAN: r0=23(x), r1=89(y), r2=68(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 89
LDI r2, 68
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
