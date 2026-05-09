; DESCRIPTION: Composite: Renders a blue disk with center (432, 36) and radius 27 then Sets a single cyan pixel at (25, 138).
; PLAN: r0=432(x), r1=36(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=138(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 36
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 138
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
