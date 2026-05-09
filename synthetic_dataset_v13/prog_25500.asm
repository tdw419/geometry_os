; DESCRIPTION: Composite: Sets a single cyan pixel at (30, 80) then Places a blue line segment connecting (134, 177) to (434, 142).
; PLAN: r0=30(x), r1=80(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=134(x1), r6=177(y1), r7=434(x2), r8=142(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 80
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 134
LDI r6, 177
LDI r7, 434
LDI r8, 142
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
