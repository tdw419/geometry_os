; DESCRIPTION: Composite: Sets a single green pixel at (107, 107) then Places a black line segment connecting (330, 100) to (444, 55).
; PLAN: r0=107(x), r1=107(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=330(x1), r6=100(y1), r7=444(x2), r8=55(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 107
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 330
LDI r6, 100
LDI r7, 444
LDI r8, 55
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
