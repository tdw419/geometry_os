; DESCRIPTION: Composite: Places a white dot at position (392, 88) then Creates a yellow circular shape at (182, 124) with radius 51.
; PLAN: r0=392(x), r1=88(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=124(y), r7=51(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 392
LDI r1, 88
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 182
LDI r6, 124
LDI r7, 51
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
