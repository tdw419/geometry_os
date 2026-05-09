; DESCRIPTION: Composite: Sets a single black pixel at (58, 78) then Places a yellow circle of radius 59 at center (264, 160).
; PLAN: r0=58(x), r1=78(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=160(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 78
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 264
LDI r6, 160
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
