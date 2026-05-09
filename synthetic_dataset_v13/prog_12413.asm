; DESCRIPTION: Composite: Sets a single red pixel at (440, 145) then Creates a yellow circular shape at (394, 47) with radius 44.
; PLAN: r0=440(x), r1=145(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=394(x), r6=47(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 440
LDI r1, 145
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 394
LDI r6, 47
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
