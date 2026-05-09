; DESCRIPTION: Composite: Places a green circle of radius 45 at center (230, 181) then Renders a red line between points (296, 109) and (172, 48) then Sets a single green pixel at (165, 117).
; PLAN: r0=230(x), r1=181(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x1), r6=109(y1), r7=172(x2), r8=48(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=165(x), r11=117(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 230
LDI r1, 181
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 109
LDI r7, 172
LDI r8, 48
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 117
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
