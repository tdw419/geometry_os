; DESCRIPTION: Composite: Sets a single yellow pixel at (474, 50) then Renders a red disk with center (281, 160) and radius 23.
; PLAN: r0=474(x), r1=50(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=160(y), r7=23(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 474
LDI r1, 50
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 281
LDI r6, 160
LDI r7, 23
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
