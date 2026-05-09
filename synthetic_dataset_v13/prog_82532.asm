; DESCRIPTION: Composite: Sets a single magenta pixel at (425, 193) then Places a blue circle of radius 77 at center (215, 90).
; PLAN: r0=425(x), r1=193(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=90(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 425
LDI r1, 193
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 215
LDI r6, 90
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
