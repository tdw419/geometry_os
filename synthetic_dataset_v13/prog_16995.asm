; DESCRIPTION: Composite: Sets a single green pixel at (163, 242) then Renders a green disk with center (146, 188) and radius 61.
; PLAN: r0=163(x), r1=242(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=146(x), r6=188(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 163
LDI r1, 242
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 146
LDI r6, 188
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
