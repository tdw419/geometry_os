; DESCRIPTION: Composite: Sets a single blue pixel at (118, 143) then Renders a magenta disk with center (84, 42) and radius 39.
; PLAN: r0=118(x), r1=143(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=84(x), r6=42(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 118
LDI r1, 143
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 84
LDI r6, 42
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
