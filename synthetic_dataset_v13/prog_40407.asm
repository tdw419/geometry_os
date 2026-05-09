; DESCRIPTION: Composite: Creates a blue circular shape at (313, 154) with radius 57 then Sets a single black pixel at (383, 107).
; PLAN: r0=313(x), r1=154(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=107(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 154
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 107
LDI r7, 0x000000
PSET r5, r6, r7
HALT
