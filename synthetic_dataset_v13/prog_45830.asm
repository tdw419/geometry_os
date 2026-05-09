; DESCRIPTION: Composite: Places a yellow dot at position (281, 237) then Renders a yellow disk with center (433, 131) and radius 35.
; PLAN: r0=281(x), r1=237(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=433(x), r6=131(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 237
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 433
LDI r6, 131
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
