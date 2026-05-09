; DESCRIPTION: Composite: Places a red dot at position (314, 231) then Creates a blue circular shape at (347, 173) with radius 23.
; PLAN: r0=314(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=173(y), r7=23(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 314
LDI r1, 231
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 347
LDI r6, 173
LDI r7, 23
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
