; DESCRIPTION: Composite: Renders a blue disk with center (466, 103) and radius 34 then Sets a single green pixel at (243, 202).
; PLAN: r0=466(x), r1=103(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x), r6=202(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 466
LDI r1, 103
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 202
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
