; DESCRIPTION: Draws a yellow rectangle at (36, 108) with width 36 and height 44.
; PLAN: r0=36(x), r1=108(y), r2=36(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 108
LDI r2, 36
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
