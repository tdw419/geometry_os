; DESCRIPTION: Composite: Places a green dot at position (63, 75) then Renders a yellow disk with center (229, 105) and radius 77.
; PLAN: r0=63(x), r1=75(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=229(x), r6=105(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 63
LDI r1, 75
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 229
LDI r6, 105
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
