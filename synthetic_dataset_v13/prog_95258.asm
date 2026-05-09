; DESCRIPTION: Composite: Sets a single white pixel at (507, 204) then Renders a magenta disk with center (223, 188) and radius 20.
; PLAN: r0=507(x), r1=204(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=188(y), r7=20(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 507
LDI r1, 204
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 188
LDI r7, 20
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
