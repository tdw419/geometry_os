; DESCRIPTION: Composite: Sets a single cyan pixel at (299, 153) then Places a blue line segment connecting (442, 112) to (281, 240).
; PLAN: r0=299(x), r1=153(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=442(x1), r6=112(y1), r7=281(x2), r8=240(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 153
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 442
LDI r6, 112
LDI r7, 281
LDI r8, 240
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
