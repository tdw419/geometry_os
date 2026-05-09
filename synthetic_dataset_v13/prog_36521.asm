; DESCRIPTION: Composite: Places a blue dot at position (323, 3) then Places a cyan line segment connecting (21, 95) to (91, 50).
; PLAN: r0=323(x), r1=3(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=21(x1), r6=95(y1), r7=91(x2), r8=50(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 3
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 21
LDI r6, 95
LDI r7, 91
LDI r8, 50
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
