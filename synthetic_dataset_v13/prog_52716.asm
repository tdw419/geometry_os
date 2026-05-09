; DESCRIPTION: Composite: Places a orange dot at position (439, 160) then Renders a blue disk with center (250, 224) and radius 28.
; PLAN: r0=439(x), r1=160(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=250(x), r6=224(y), r7=28(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 160
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 250
LDI r6, 224
LDI r7, 28
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
