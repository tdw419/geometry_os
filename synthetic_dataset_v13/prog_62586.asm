; DESCRIPTION: Composite: Sets a single blue pixel at (471, 126) then Renders a yellow line between points (160, 61) and (185, 63).
; PLAN: r0=471(x), r1=126(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=160(x1), r6=61(y1), r7=185(x2), r8=63(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 126
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 160
LDI r6, 61
LDI r7, 185
LDI r8, 63
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
