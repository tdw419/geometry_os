; DESCRIPTION: Composite: Places a yellow dot at position (246, 15) then Places a cyan line segment connecting (251, 3) to (389, 111).
; PLAN: r0=246(x), r1=15(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=251(x1), r6=3(y1), r7=389(x2), r8=111(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 15
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 251
LDI r6, 3
LDI r7, 389
LDI r8, 111
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
