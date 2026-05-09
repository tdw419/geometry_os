; DESCRIPTION: Composite: Places a black line segment connecting (105, 9) to (340, 54) then Sets a single black pixel at (170, 254).
; PLAN: r0=105(x1), r1=9(y1), r2=340(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=254(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 9
LDI r2, 340
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 254
LDI r7, 0x000000
PSET r5, r6, r7
HALT
