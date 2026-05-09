; DESCRIPTION: Composite: Sets a single blue pixel at (290, 152) then Creates a orange circular shape at (78, 157) with radius 59.
; PLAN: r0=290(x), r1=152(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=157(y), r7=59(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 290
LDI r1, 152
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 157
LDI r7, 59
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
