; DESCRIPTION: Composite: Sets a single red pixel at (22, 116) then Creates a white circular shape at (103, 149) with radius 65.
; PLAN: r0=22(x), r1=116(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=149(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 22
LDI r1, 116
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 103
LDI r6, 149
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
