; DESCRIPTION: Composite: Places a yellow dot at position (133, 65) then Places a orange circle of radius 45 at center (364, 200).
; PLAN: r0=133(x), r1=65(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=200(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 65
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 364
LDI r6, 200
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
