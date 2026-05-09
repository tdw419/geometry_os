; DESCRIPTION: Composite: Sets a single red pixel at (290, 162) then Places a red circle of radius 57 at center (435, 71).
; PLAN: r0=290(x), r1=162(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=435(x), r6=71(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 290
LDI r1, 162
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 435
LDI r6, 71
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
