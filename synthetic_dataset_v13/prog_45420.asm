; DESCRIPTION: Composite: Places a blue circle of radius 80 at center (95, 139) then Places a red dot at position (448, 111).
; PLAN: r0=95(x), r1=139(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x), r6=111(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 139
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 111
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
