; DESCRIPTION: Composite: Sets a single cyan pixel at (451, 72) then Renders a green line between points (474, 83) and (309, 128).
; PLAN: r0=451(x), r1=72(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=474(x1), r6=83(y1), r7=309(x2), r8=128(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 72
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 474
LDI r6, 83
LDI r7, 309
LDI r8, 128
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
