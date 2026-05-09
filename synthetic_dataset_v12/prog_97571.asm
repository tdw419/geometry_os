; DESCRIPTION: Composite: Sets a single orange pixel at (294, 38) then Places a yellow circle of radius 38 at center (412, 45).
; PLAN: r0=294(x), r1=38(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=45(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 294
LDI r1, 38
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 412
LDI r6, 45
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
