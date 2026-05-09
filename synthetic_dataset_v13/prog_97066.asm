; DESCRIPTION: Composite: Places a blue circle of radius 12 at center (250, 215) then Sets a single purple pixel at (96, 143).
; PLAN: r0=250(x), r1=215(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=143(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 215
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 143
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
