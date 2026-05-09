; DESCRIPTION: Composite: Places a orange circle of radius 29 at center (210, 68) then Sets a single orange pixel at (283, 27).
; PLAN: r0=210(x), r1=68(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=27(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 210
LDI r1, 68
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 27
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
