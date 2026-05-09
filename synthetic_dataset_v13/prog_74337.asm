; DESCRIPTION: Composite: Creates a blue circular shape at (136, 179) with radius 77 then Renders a cyan line between points (478, 99) and (270, 200) then Places a yellow dot at position (152, 150).
; PLAN: r0=136(x), r1=179(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x1), r6=99(y1), r7=270(x2), r8=200(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=152(x), r11=150(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 136
LDI r1, 179
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 99
LDI r7, 270
LDI r8, 200
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 150
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
