; DESCRIPTION: Composite: Places a black circle of radius 65 at center (313, 174) then Sets a single green pixel at (320, 89).
; PLAN: r0=313(x), r1=174(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x), r6=89(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 174
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 89
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
