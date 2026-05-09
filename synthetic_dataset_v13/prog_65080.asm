; DESCRIPTION: Composite: Places a orange dot at position (386, 100) then Renders a blue disk with center (103, 119) and radius 71.
; PLAN: r0=386(x), r1=100(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=119(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 386
LDI r1, 100
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 103
LDI r6, 119
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
