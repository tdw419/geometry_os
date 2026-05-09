; DESCRIPTION: Composite: Renders a blue disk with center (243, 113) and radius 10 then Sets a single yellow pixel at (85, 12).
; PLAN: r0=243(x), r1=113(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=12(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 243
LDI r1, 113
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 12
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
