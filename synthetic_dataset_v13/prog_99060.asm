; DESCRIPTION: Composite: Renders a magenta disk with center (277, 135) and radius 75 then Sets a single yellow pixel at (468, 115).
; PLAN: r0=277(x), r1=135(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=468(x), r6=115(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 277
LDI r1, 135
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 468
LDI r6, 115
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
