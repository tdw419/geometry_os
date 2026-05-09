; DESCRIPTION: Composite: Sets a single white pixel at (393, 121) then Renders a magenta disk with center (324, 67) and radius 40.
; PLAN: r0=393(x), r1=121(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=67(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 393
LDI r1, 121
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 67
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
