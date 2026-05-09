; DESCRIPTION: Composite: Places a green dot at position (177, 185) then Renders a green disk with center (303, 77) and radius 62.
; PLAN: r0=177(x), r1=185(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=303(x), r6=77(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 177
LDI r1, 185
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 303
LDI r6, 77
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
