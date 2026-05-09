; DESCRIPTION: Composite: Places a yellow dot at position (106, 251) then Places a blue line segment connecting (349, 194) to (192, 2).
; PLAN: r0=106(x), r1=251(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=349(x1), r6=194(y1), r7=192(x2), r8=2(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 251
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 349
LDI r6, 194
LDI r7, 192
LDI r8, 2
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
