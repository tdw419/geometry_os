; DESCRIPTION: Composite: Renders a cyan line between points (88, 211) and (293, 135) then Sets a single green pixel at (248, 241).
; PLAN: r0=88(x1), r1=211(y1), r2=293(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=241(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 88
LDI r1, 211
LDI r2, 293
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 241
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
