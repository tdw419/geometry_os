; DESCRIPTION: Draws a orange circle centered at (144, 129) with radius 78.
; PLAN: r0=144(x), r1=129(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 129
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
