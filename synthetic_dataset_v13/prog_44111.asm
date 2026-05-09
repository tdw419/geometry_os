; DESCRIPTION: Draws a green circle centered at (223, 129) with radius 70.
; PLAN: r0=223(x), r1=129(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 129
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
