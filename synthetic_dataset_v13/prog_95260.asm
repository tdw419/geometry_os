; DESCRIPTION: Composite: Places a orange dot at position (495, 0) then Places a yellow circle of radius 37 at center (307, 80).
; PLAN: r0=495(x), r1=0(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=80(y), r7=37(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 495
LDI r1, 0
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 307
LDI r6, 80
LDI r7, 37
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
