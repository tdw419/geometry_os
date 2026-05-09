; DESCRIPTION: Composite: Creates a magenta circular shape at (124, 208) with radius 33 then Sets a single yellow pixel at (405, 48).
; PLAN: r0=124(x), r1=208(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x), r6=48(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 124
LDI r1, 208
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 48
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
