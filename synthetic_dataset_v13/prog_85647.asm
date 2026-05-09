; DESCRIPTION: Draws a yellow rectangle at (111, 189) with width 94 and height 62.
; PLAN: r0=111(x), r1=189(y), r2=94(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 189
LDI r2, 94
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
