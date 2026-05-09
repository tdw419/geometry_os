; DESCRIPTION: Composite: Sets a single red pixel at (169, 19) then Draws a cyan circle centered at (407, 168) with radius 21.
; PLAN: r0=169(x), r1=19(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=168(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 169
LDI r1, 19
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 407
LDI r6, 168
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
