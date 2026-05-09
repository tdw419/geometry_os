; DESCRIPTION: Draws a green circle centered at (154, 129) with radius 55.
; PLAN: r0=154(x), r1=129(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 129
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
