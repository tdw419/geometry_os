; DESCRIPTION: Composite: Sets a single red pixel at (164, 176) then Renders a white line between points (401, 50) and (402, 87) then Draws a black circle centered at (331, 159) with radius 79.
; PLAN: r0=164(x), r1=176(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=401(x1), r6=50(y1), r7=402(x2), r8=87(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=331(x), r11=159(y), r12=79(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 176
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 401
LDI r6, 50
LDI r7, 402
LDI r8, 87
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 159
LDI r12, 79
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
