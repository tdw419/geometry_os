; DESCRIPTION: Composite: Places a black circle of radius 10 at center (29, 186) then Sets a single black pixel at (350, 55).
; PLAN: r0=29(x), r1=186(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=55(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 29
LDI r1, 186
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 55
LDI r7, 0x000000
PSET r5, r6, r7
HALT
