; DESCRIPTION: Composite: Sets a single magenta pixel at (152, 225) then Creates a red circular shape at (206, 69) with radius 20.
; PLAN: r0=152(x), r1=225(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=69(y), r7=20(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 152
LDI r1, 225
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 206
LDI r6, 69
LDI r7, 20
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
