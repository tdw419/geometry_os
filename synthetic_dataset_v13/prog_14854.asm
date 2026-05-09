; DESCRIPTION: Composite: Places a yellow dot at position (258, 88) then Places a green circle of radius 21 at center (470, 185).
; PLAN: r0=258(x), r1=88(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=470(x), r6=185(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 258
LDI r1, 88
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 470
LDI r6, 185
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
