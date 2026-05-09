; DESCRIPTION: Composite: Sets a single magenta pixel at (484, 121) then Renders a orange disk with center (295, 101) and radius 72.
; PLAN: r0=484(x), r1=121(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=101(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 484
LDI r1, 121
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 295
LDI r6, 101
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
