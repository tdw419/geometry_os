; DESCRIPTION: Composite: Sets a single orange pixel at (466, 133) then Renders a black disk with center (38, 124) and radius 36.
; PLAN: r0=466(x), r1=133(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=38(x), r6=124(y), r7=36(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 466
LDI r1, 133
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 38
LDI r6, 124
LDI r7, 36
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
