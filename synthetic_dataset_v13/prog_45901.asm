; DESCRIPTION: Composite: Renders a black disk with center (450, 201) and radius 28 then Renders a orange line between points (348, 131) and (345, 93) then Places a green dot at position (24, 204).
; PLAN: r0=450(x), r1=201(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x1), r6=131(y1), r7=345(x2), r8=93(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=24(x), r11=204(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 450
LDI r1, 201
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 131
LDI r7, 345
LDI r8, 93
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 24
LDI r11, 204
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
