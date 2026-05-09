; DESCRIPTION: Composite: Sets a single red pixel at (352, 160) then Renders a red disk with center (371, 106) and radius 24.
; PLAN: r0=352(x), r1=160(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=106(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 352
LDI r1, 160
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 371
LDI r6, 106
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
