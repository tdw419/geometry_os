; DESCRIPTION: Composite: Sets a single magenta pixel at (148, 117) then Renders a red disk with center (63, 146) and radius 55.
; PLAN: r0=148(x), r1=117(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=146(y), r7=55(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 148
LDI r1, 117
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 63
LDI r6, 146
LDI r7, 55
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
