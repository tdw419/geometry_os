; DESCRIPTION: Composite: Sets a single magenta pixel at (13, 98) then Renders a cyan line between points (360, 50) and (399, 232) then Creates a purple circular shape at (314, 157) with radius 52.
; PLAN: r0=13(x), r1=98(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=360(x1), r6=50(y1), r7=399(x2), r8=232(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=157(y), r12=52(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 13
LDI r1, 98
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 360
LDI r6, 50
LDI r7, 399
LDI r8, 232
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 157
LDI r12, 52
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
