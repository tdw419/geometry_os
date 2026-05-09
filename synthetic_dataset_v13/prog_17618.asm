; DESCRIPTION: Composite: Places a white dot at position (90, 116) then Places a magenta circle of radius 76 at center (147, 163).
; PLAN: r0=90(x), r1=116(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=163(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 90
LDI r1, 116
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 147
LDI r6, 163
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
