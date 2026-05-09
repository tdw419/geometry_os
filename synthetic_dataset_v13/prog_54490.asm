; DESCRIPTION: Composite: Places a red circle of radius 11 at center (346, 81) then Sets a single purple pixel at (68, 169).
; PLAN: r0=346(x), r1=81(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=169(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 346
LDI r1, 81
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 169
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
