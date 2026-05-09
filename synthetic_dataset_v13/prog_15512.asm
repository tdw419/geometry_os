; DESCRIPTION: Composite: Sets a single white pixel at (387, 125) then Renders a blue disk with center (259, 156) and radius 10.
; PLAN: r0=387(x), r1=125(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=156(y), r7=10(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 387
LDI r1, 125
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 259
LDI r6, 156
LDI r7, 10
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
