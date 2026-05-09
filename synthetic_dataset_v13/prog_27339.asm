; DESCRIPTION: Draws a yellow rectangle at (111, 37) with width 94 and height 56.
; PLAN: r0=111(x), r1=37(y), r2=94(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 37
LDI r2, 94
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
