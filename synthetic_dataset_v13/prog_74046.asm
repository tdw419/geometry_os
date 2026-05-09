; DESCRIPTION: Draws a yellow rectangle at (46, 19) with width 99 and height 36.
; PLAN: r0=46(x), r1=19(y), r2=99(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 19
LDI r2, 99
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
