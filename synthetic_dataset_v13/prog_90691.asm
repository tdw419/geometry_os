; DESCRIPTION: Composite: Renders a black disk with center (309, 146) and radius 51 then Sets a single magenta pixel at (154, 169).
; PLAN: r0=309(x), r1=146(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=169(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 146
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 169
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
