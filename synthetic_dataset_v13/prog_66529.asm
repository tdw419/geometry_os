; DESCRIPTION: Composite: Places a orange circle of radius 76 at center (313, 100) then Sets a single black pixel at (307, 149).
; PLAN: r0=313(x), r1=100(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=149(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 100
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 149
LDI r7, 0x000000
PSET r5, r6, r7
HALT
