; DESCRIPTION: Composite: Sets a single purple pixel at (163, 129) then Draws a yellow circle centered at (269, 142) with radius 64.
; PLAN: r0=163(x), r1=129(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=142(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 163
LDI r1, 129
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 269
LDI r6, 142
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
