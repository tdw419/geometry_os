; DESCRIPTION: Composite: Places a magenta dot at position (266, 18) then Places a yellow circle of radius 46 at center (192, 149).
; PLAN: r0=266(x), r1=18(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=149(y), r7=46(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 266
LDI r1, 18
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 149
LDI r7, 46
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
