; DESCRIPTION: Composite: Sets a single yellow pixel at (419, 44) then Draws a blue line from (5, 29) to (506, 30).
; PLAN: r0=419(x), r1=44(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=5(x1), r6=29(y1), r7=506(x2), r8=30(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 44
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 5
LDI r6, 29
LDI r7, 506
LDI r8, 30
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
