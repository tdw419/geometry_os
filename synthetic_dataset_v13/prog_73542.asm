; DESCRIPTION: Composite: Sets a single red pixel at (95, 139) then Places a magenta circle of radius 79 at center (346, 168).
; PLAN: r0=95(x), r1=139(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=168(y), r7=79(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 95
LDI r1, 139
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 346
LDI r6, 168
LDI r7, 79
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
