; DESCRIPTION: Composite: Places a magenta dot at position (462, 52) then Creates a red circular shape at (211, 133) with radius 71.
; PLAN: r0=462(x), r1=52(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=133(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 462
LDI r1, 52
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 133
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
