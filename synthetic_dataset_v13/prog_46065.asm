; DESCRIPTION: Draws a yellow rectangle at (191, 129) with width 37 and height 83.
; PLAN: r0=191(x), r1=129(y), r2=37(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 129
LDI r2, 37
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
