; DESCRIPTION: Composite: Sets a single cyan pixel at (348, 172) then Renders a purple line between points (255, 58) and (168, 111).
; PLAN: r0=348(x), r1=172(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=255(x1), r6=58(y1), r7=168(x2), r8=111(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 172
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 255
LDI r6, 58
LDI r7, 168
LDI r8, 111
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
