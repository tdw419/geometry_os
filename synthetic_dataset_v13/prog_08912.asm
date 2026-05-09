; DESCRIPTION: Composite: Sets a single magenta pixel at (226, 10) then Places a red circle of radius 75 at center (175, 173).
; PLAN: r0=226(x), r1=10(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=173(y), r7=75(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 226
LDI r1, 10
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 175
LDI r6, 173
LDI r7, 75
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
