; DESCRIPTION: Composite: Places a blue circle of radius 37 at center (439, 140) then Renders a yellow line between points (125, 45) and (3, 91).
; PLAN: r0=439(x), r1=140(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x1), r6=45(y1), r7=3(x2), r8=91(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 140
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 45
LDI r7, 3
LDI r8, 91
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
