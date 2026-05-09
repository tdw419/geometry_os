; DESCRIPTION: Draws a red circle centered at (66, 129) with radius 17.
; PLAN: r0=66(x), r1=129(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 129
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
