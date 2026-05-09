; DESCRIPTION: Composite: Places a cyan dot at position (470, 80) then Creates a blue circular shape at (147, 192) with radius 46.
; PLAN: r0=470(x), r1=80(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=192(y), r7=46(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 470
LDI r1, 80
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 147
LDI r6, 192
LDI r7, 46
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
