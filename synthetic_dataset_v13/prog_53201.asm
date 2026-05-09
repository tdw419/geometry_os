; DESCRIPTION: Composite: Places a white line segment connecting (45, 112) to (418, 48) then Sets a single yellow pixel at (224, 178).
; PLAN: r0=45(x1), r1=112(y1), r2=418(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=178(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 45
LDI r1, 112
LDI r2, 418
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 178
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
