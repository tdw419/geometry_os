; DESCRIPTION: Composite: Sets a single red pixel at (164, 118) then Creates a green circular shape at (174, 152) with radius 55.
; PLAN: r0=164(x), r1=118(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=152(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 164
LDI r1, 118
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 174
LDI r6, 152
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
