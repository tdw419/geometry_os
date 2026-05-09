; DESCRIPTION: Composite: Renders a blue disk with center (263, 128) and radius 45 then Sets a single white pixel at (236, 106).
; PLAN: r0=263(x), r1=128(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=106(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 263
LDI r1, 128
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 106
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
