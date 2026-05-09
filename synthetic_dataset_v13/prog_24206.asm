; DESCRIPTION: Composite: Sets a single red pixel at (465, 50) then Places a blue line segment connecting (193, 179) to (20, 119).
; PLAN: r0=465(x), r1=50(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=193(x1), r6=179(y1), r7=20(x2), r8=119(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 465
LDI r1, 50
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 193
LDI r6, 179
LDI r7, 20
LDI r8, 119
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
