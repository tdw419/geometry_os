; DESCRIPTION: Draws a blue circle centered at (95, 129) with radius 53.
; PLAN: r0=95(x), r1=129(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 129
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
