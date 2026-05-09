; DESCRIPTION: Composite: Sets a single green pixel at (41, 144) then Places a green line segment connecting (409, 95) to (195, 31) then Renders a white disk with center (79, 27) and radius 26.
; PLAN: r0=41(x), r1=144(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=409(x1), r6=95(y1), r7=195(x2), r8=31(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=79(x), r11=27(y), r12=26(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 41
LDI r1, 144
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 409
LDI r6, 95
LDI r7, 195
LDI r8, 31
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 27
LDI r12, 26
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
