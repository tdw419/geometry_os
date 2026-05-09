; DESCRIPTION: Composite: Places a yellow dot at position (144, 211) then Renders a green disk with center (168, 178) and radius 22.
; PLAN: r0=144(x), r1=211(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=178(y), r7=22(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 144
LDI r1, 211
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 168
LDI r6, 178
LDI r7, 22
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
