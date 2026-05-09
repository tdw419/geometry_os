; DESCRIPTION: Composite: Renders a green disk with center (254, 115) and radius 65 then Sets a single black pixel at (284, 85).
; PLAN: r0=254(x), r1=115(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=85(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 115
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 85
LDI r7, 0x000000
PSET r5, r6, r7
HALT
