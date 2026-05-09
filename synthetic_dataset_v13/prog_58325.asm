; DESCRIPTION: Composite: Places a green dot at position (71, 200) then Renders a black disk with center (302, 164) and radius 56.
; PLAN: r0=71(x), r1=200(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=164(y), r7=56(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 71
LDI r1, 200
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 302
LDI r6, 164
LDI r7, 56
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
