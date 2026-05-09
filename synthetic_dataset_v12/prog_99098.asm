; DESCRIPTION: Draws a yellow rectangle at (279, 4) with width 36 and height 34.
; PLAN: r0=279(x), r1=4(y), r2=36(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 4
LDI r2, 36
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
