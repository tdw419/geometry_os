; DESCRIPTION: Draws a yellow rectangle at (138, 52) with width 12 and height 64.
; PLAN: r0=138(x), r1=52(y), r2=12(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 52
LDI r2, 12
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
