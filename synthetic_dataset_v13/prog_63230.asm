; DESCRIPTION: Composite: Places a magenta dot at position (509, 237) then Creates a yellow circular shape at (400, 57) with radius 25.
; PLAN: r0=509(x), r1=237(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=57(y), r7=25(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 509
LDI r1, 237
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 400
LDI r6, 57
LDI r7, 25
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
