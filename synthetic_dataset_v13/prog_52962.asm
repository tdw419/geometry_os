; DESCRIPTION: Composite: Renders a magenta disk with center (271, 127) and radius 52 then Sets a single white pixel at (234, 177).
; PLAN: r0=271(x), r1=127(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=177(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 127
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 177
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
