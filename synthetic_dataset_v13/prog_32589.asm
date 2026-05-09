; DESCRIPTION: Composite: Creates a white circular shape at (428, 168) with radius 33 then Sets a single yellow pixel at (150, 145).
; PLAN: r0=428(x), r1=168(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=145(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 428
LDI r1, 168
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 145
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
