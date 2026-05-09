; DESCRIPTION: Composite: Sets a single blue pixel at (462, 181) then Renders a yellow line between points (373, 205) and (144, 11).
; PLAN: r0=462(x), r1=181(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=373(x1), r6=205(y1), r7=144(x2), r8=11(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 181
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 373
LDI r6, 205
LDI r7, 144
LDI r8, 11
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
