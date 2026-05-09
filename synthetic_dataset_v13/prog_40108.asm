; DESCRIPTION: Composite: Renders a red line between points (287, 2) and (144, 70) then Places a white dot at position (172, 189) then Draws a cyan circle centered at (329, 144) with radius 63.
; PLAN: r0=287(x1), r1=2(y1), r2=144(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=189(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=329(x), r11=144(y), r12=63(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 2
LDI r2, 144
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 189
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 329
LDI r11, 144
LDI r12, 63
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
