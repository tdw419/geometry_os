; DESCRIPTION: Composite: Sets a single blue pixel at (178, 206) then Renders a magenta disk with center (460, 160) and radius 40.
; PLAN: r0=178(x), r1=206(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=460(x), r6=160(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 178
LDI r1, 206
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 460
LDI r6, 160
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
