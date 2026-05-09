; DESCRIPTION: Composite: Sets a single magenta pixel at (433, 144) then Places a green line segment connecting (4, 80) to (145, 12).
; PLAN: r0=433(x), r1=144(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=4(x1), r6=80(y1), r7=145(x2), r8=12(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 144
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 4
LDI r6, 80
LDI r7, 145
LDI r8, 12
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
