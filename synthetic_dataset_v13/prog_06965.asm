; DESCRIPTION: Draws a yellow rectangle at (166, 150) with width 89 and height 80.
; PLAN: r0=166(x), r1=150(y), r2=89(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 150
LDI r2, 89
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
