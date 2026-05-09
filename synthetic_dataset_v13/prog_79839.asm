; DESCRIPTION: Composite: Places a orange dot at position (168, 152) then Creates a red circular shape at (320, 189) with radius 56.
; PLAN: r0=168(x), r1=152(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=189(y), r7=56(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 168
LDI r1, 152
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 320
LDI r6, 189
LDI r7, 56
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
