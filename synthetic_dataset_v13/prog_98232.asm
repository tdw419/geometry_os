; DESCRIPTION: Draws a yellow rectangle at (78, 129) with width 89 and height 101.
; PLAN: r0=78(x), r1=129(y), r2=89(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 129
LDI r2, 89
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
