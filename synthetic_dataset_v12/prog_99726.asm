; DESCRIPTION: Composite: Places a cyan dot at position (200, 50) then Creates a cyan circular shape at (469, 240) with radius 16.
; PLAN: r0=200(x), r1=50(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=469(x), r6=240(y), r7=16(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 200
LDI r1, 50
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 469
LDI r6, 240
LDI r7, 16
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
