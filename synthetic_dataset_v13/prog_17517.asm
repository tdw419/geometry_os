; DESCRIPTION: Composite: Sets a single magenta pixel at (266, 71) then Places a white circle of radius 57 at center (262, 174).
; PLAN: r0=266(x), r1=71(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=262(x), r6=174(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 266
LDI r1, 71
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 262
LDI r6, 174
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
