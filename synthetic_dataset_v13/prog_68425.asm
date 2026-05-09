; DESCRIPTION: Composite: Sets a single green pixel at (218, 46) then Places a green circle of radius 54 at center (312, 88).
; PLAN: r0=218(x), r1=46(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=88(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 218
LDI r1, 46
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 312
LDI r6, 88
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
