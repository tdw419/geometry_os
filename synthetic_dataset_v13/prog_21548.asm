; DESCRIPTION: Composite: Sets a single magenta pixel at (410, 22) then Places a red circle of radius 79 at center (385, 93).
; PLAN: r0=410(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=93(y), r7=79(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 410
LDI r1, 22
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 385
LDI r6, 93
LDI r7, 79
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
