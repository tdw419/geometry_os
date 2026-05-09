; DESCRIPTION: Composite: Places a blue dot at position (364, 54) then Creates a red circular shape at (423, 171) with radius 16.
; PLAN: r0=364(x), r1=54(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=423(x), r6=171(y), r7=16(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 364
LDI r1, 54
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 423
LDI r6, 171
LDI r7, 16
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
