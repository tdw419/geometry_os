; DESCRIPTION: Composite: Renders a black line between points (77, 98) and (129, 237) then Sets a single cyan pixel at (23, 38).
; PLAN: r0=77(x1), r1=98(y1), r2=129(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=38(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 98
LDI r2, 129
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 38
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
