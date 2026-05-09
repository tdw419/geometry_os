; DESCRIPTION: Composite: Renders a cyan disk with center (420, 127) and radius 62 then Sets a single purple pixel at (142, 58).
; PLAN: r0=420(x), r1=127(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x), r6=58(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 420
LDI r1, 127
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 58
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
