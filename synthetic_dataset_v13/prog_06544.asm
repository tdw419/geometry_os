; DESCRIPTION: Composite: Sets a single green pixel at (398, 204) then Creates a yellow circular shape at (386, 187) with radius 36.
; PLAN: r0=398(x), r1=204(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=187(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 398
LDI r1, 204
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 386
LDI r6, 187
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
