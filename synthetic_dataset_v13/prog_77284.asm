; DESCRIPTION: Composite: Places a purple dot at position (298, 7) then Places a yellow circle of radius 23 at center (131, 137).
; PLAN: r0=298(x), r1=7(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=137(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 7
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 137
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
