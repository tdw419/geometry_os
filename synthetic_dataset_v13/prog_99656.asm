; DESCRIPTION: Composite: Sets a single black pixel at (95, 162) then Renders a red disk with center (265, 95) and radius 72.
; PLAN: r0=95(x), r1=162(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=265(x), r6=95(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 95
LDI r1, 162
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 265
LDI r6, 95
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
