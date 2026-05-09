; DESCRIPTION: Draws a green rectangle at (46, 51) with width 68 and height 23.
; PLAN: r0=46(x), r1=51(y), r2=68(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 51
LDI r2, 68
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
