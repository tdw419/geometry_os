; DESCRIPTION: Draws a yellow rectangle at (350, 129) with width 25 and height 62.
; PLAN: r0=350(x), r1=129(y), r2=25(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 129
LDI r2, 25
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
