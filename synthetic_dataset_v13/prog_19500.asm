; DESCRIPTION: Composite: Renders a green disk with center (93, 120) and radius 52 then Renders a red line between points (409, 241) and (164, 172) then Places a blue dot at position (201, 173).
; PLAN: r0=93(x), r1=120(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x1), r6=241(y1), r7=164(x2), r8=172(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=201(x), r11=173(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 93
LDI r1, 120
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 241
LDI r7, 164
LDI r8, 172
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 173
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
