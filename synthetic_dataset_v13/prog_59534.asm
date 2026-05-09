; DESCRIPTION: Composite: Renders a magenta disk with center (296, 75) and radius 67 then Sets a single purple pixel at (409, 40).
; PLAN: r0=296(x), r1=75(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=40(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 296
LDI r1, 75
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 40
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
