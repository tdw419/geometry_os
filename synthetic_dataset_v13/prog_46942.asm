; DESCRIPTION: Composite: Places a yellow dot at position (113, 227) then Renders a orange disk with center (29, 218) and radius 22.
; PLAN: r0=113(x), r1=227(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=29(x), r6=218(y), r7=22(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 113
LDI r1, 227
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 29
LDI r6, 218
LDI r7, 22
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
