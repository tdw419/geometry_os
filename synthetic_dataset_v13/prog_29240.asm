; DESCRIPTION: Composite: Places a purple circle of radius 60 at center (75, 174) then Sets a single black pixel at (254, 146).
; PLAN: r0=75(x), r1=174(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=146(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 174
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 146
LDI r7, 0x000000
PSET r5, r6, r7
HALT
