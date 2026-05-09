; DESCRIPTION: Composite: Places a red circle of radius 46 at center (321, 145) then Places a cyan dot at position (172, 226).
; PLAN: r0=321(x), r1=145(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=226(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 145
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 226
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
