; DESCRIPTION: Composite: Places a magenta dot at position (458, 64) then Creates a magenta circular shape at (367, 152) with radius 38.
; PLAN: r0=458(x), r1=64(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=152(y), r7=38(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 458
LDI r1, 64
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 152
LDI r7, 38
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
