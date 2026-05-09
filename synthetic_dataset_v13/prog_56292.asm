; DESCRIPTION: Composite: Places a black dot at position (164, 180) then Renders a green disk with center (153, 99) and radius 22.
; PLAN: r0=164(x), r1=180(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=99(y), r7=22(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 164
LDI r1, 180
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 153
LDI r6, 99
LDI r7, 22
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
