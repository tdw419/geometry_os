; DESCRIPTION: Composite: Places a orange dot at position (248, 116) then Renders a green disk with center (76, 147) and radius 50 then Renders a cyan line between points (97, 201) and (350, 168).
; PLAN: r0=248(x), r1=116(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=76(x), r6=147(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=97(x1), r11=201(y1), r12=350(x2), r13=168(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 116
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 76
LDI r6, 147
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 97
LDI r11, 201
LDI r12, 350
LDI r13, 168
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
