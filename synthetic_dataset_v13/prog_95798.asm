; DESCRIPTION: Composite: Renders a magenta disk with center (273, 124) and radius 68 then Sets a single orange pixel at (248, 113).
; PLAN: r0=273(x), r1=124(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=113(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 124
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 113
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
