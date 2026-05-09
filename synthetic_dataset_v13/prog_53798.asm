; DESCRIPTION: Composite: Creates a magenta circular shape at (369, 228) with radius 22 then Sets a single orange pixel at (323, 148).
; PLAN: r0=369(x), r1=228(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=148(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 369
LDI r1, 228
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 148
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
