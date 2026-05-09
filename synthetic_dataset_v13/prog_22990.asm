; DESCRIPTION: Composite: Places a green dot at position (407, 152) then Creates a yellow circular shape at (142, 184) with radius 13.
; PLAN: r0=407(x), r1=152(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=142(x), r6=184(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 152
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 142
LDI r6, 184
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
