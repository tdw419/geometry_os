; DESCRIPTION: Composite: Places a red dot at position (431, 234) then Renders a cyan disk with center (285, 163) and radius 80.
; PLAN: r0=431(x), r1=234(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=163(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 431
LDI r1, 234
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 285
LDI r6, 163
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
