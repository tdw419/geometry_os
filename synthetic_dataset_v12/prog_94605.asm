; DESCRIPTION: Draws a yellow rectangle at (457, 89) with width 32 and height 19.
; PLAN: r0=457(x), r1=89(y), r2=32(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 89
LDI r2, 32
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
