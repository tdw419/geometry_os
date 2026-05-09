; DESCRIPTION: Composite: Renders a black disk with center (243, 22) and radius 19 then Sets a single yellow pixel at (367, 196).
; PLAN: r0=243(x), r1=22(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=196(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 243
LDI r1, 22
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 196
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
