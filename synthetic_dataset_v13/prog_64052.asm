; DESCRIPTION: Composite: Sets a single blue pixel at (62, 99) then Renders a green line between points (46, 243) and (511, 192).
; PLAN: r0=62(x), r1=99(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=46(x1), r6=243(y1), r7=511(x2), r8=192(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 99
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 46
LDI r6, 243
LDI r7, 511
LDI r8, 192
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
