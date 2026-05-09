; DESCRIPTION: Composite: Sets a single green pixel at (262, 146) then Renders a green disk with center (224, 142) and radius 55.
; PLAN: r0=262(x), r1=146(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=142(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 146
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 224
LDI r6, 142
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
