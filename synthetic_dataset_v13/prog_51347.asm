; DESCRIPTION: Composite: Renders a white disk with center (248, 150) and radius 44 then Places a cyan dot at position (433, 110).
; PLAN: r0=248(x), r1=150(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x), r6=110(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 150
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 110
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
