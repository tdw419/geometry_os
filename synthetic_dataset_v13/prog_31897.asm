; DESCRIPTION: Composite: Sets a single magenta pixel at (287, 255) then Renders a magenta disk with center (193, 179) and radius 64.
; PLAN: r0=287(x), r1=255(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=193(x), r6=179(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 287
LDI r1, 255
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 193
LDI r6, 179
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
