; DESCRIPTION: Composite: Sets a single magenta pixel at (98, 91) then Places a green circle of radius 44 at center (137, 65).
; PLAN: r0=98(x), r1=91(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=65(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 98
LDI r1, 91
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 137
LDI r6, 65
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
