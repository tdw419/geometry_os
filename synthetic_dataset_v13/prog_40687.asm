; DESCRIPTION: Composite: Places a red dot at position (325, 47) then Creates a red circular shape at (152, 178) with radius 57.
; PLAN: r0=325(x), r1=47(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=178(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 325
LDI r1, 47
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 152
LDI r6, 178
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
