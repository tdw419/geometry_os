; DESCRIPTION: Composite: Places a yellow circle of radius 10 at center (420, 105) then Places a yellow dot at position (357, 141).
; PLAN: r0=420(x), r1=105(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=141(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 420
LDI r1, 105
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 141
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
