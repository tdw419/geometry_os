; DESCRIPTION: Composite: Sets a single orange pixel at (92, 243) then Renders a green disk with center (283, 157) and radius 34.
; PLAN: r0=92(x), r1=243(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=157(y), r7=34(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 92
LDI r1, 243
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 283
LDI r6, 157
LDI r7, 34
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
