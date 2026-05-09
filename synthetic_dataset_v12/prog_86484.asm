; DESCRIPTION: Composite: Places a yellow dot at position (360, 16) then Creates a green circular shape at (427, 108) with radius 55.
; PLAN: r0=360(x), r1=16(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=108(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 16
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 427
LDI r6, 108
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
