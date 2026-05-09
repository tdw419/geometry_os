; DESCRIPTION: Composite: Renders a black line between points (364, 40) and (354, 250) then Places a yellow dot at position (381, 233).
; PLAN: r0=364(x1), r1=40(y1), r2=354(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=233(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 40
LDI r2, 354
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 233
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
