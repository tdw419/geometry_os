; DESCRIPTION: Composite: Sets a single magenta pixel at (14, 168) then Creates a red circular shape at (298, 163) with radius 30.
; PLAN: r0=14(x), r1=168(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=163(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 14
LDI r1, 168
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 298
LDI r6, 163
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
