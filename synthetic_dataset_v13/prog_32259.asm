; DESCRIPTION: Composite: Renders a yellow line between points (139, 8) and (46, 54) then Sets a single blue pixel at (63, 95).
; PLAN: r0=139(x1), r1=8(y1), r2=46(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=95(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 139
LDI r1, 8
LDI r2, 46
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 95
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
