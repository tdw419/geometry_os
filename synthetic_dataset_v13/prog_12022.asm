; DESCRIPTION: Draws a green rectangle at (357, 129) with width 91 and height 63.
; PLAN: r0=357(x), r1=129(y), r2=91(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 129
LDI r2, 91
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
