; DESCRIPTION: Composite: Sets a single cyan pixel at (131, 200) then Draws a black circle centered at (305, 68) with radius 28.
; PLAN: r0=131(x), r1=200(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=68(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 131
LDI r1, 200
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 68
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
