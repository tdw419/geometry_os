; DESCRIPTION: Composite: Renders a blue disk with center (72, 137) and radius 42 then Sets a single cyan pixel at (240, 251).
; PLAN: r0=72(x), r1=137(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=251(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 137
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 251
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
