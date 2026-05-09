; DESCRIPTION: Composite: Places a green circle of radius 64 at center (134, 127) then Sets a single purple pixel at (21, 163).
; PLAN: r0=134(x), r1=127(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x), r6=163(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 134
LDI r1, 127
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 163
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
