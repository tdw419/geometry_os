; DESCRIPTION: Composite: Places a yellow circle of radius 30 at center (273, 36) then Sets a single orange pixel at (108, 95).
; PLAN: r0=273(x), r1=36(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=95(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 36
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 95
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
