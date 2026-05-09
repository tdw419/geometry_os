; DESCRIPTION: Composite: Places a black dot at position (232, 152) then Renders a yellow disk with center (223, 125) and radius 20.
; PLAN: r0=232(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=125(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 232
LDI r1, 152
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 223
LDI r6, 125
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
