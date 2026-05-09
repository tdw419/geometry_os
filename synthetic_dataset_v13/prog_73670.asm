; DESCRIPTION: Composite: Places a green dot at position (448, 0) then Places a green line segment connecting (180, 232) to (462, 56).
; PLAN: r0=448(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=180(x1), r6=232(y1), r7=462(x2), r8=56(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 180
LDI r6, 232
LDI r7, 462
LDI r8, 56
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
