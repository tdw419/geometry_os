; DESCRIPTION: Composite: Sets a single white pixel at (423, 188) then Renders a red disk with center (384, 63) and radius 50.
; PLAN: r0=423(x), r1=188(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=384(x), r6=63(y), r7=50(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 423
LDI r1, 188
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 384
LDI r6, 63
LDI r7, 50
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
