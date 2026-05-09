; DESCRIPTION: Composite: Draws a red line from (187, 147) to (241, 19) then Places a orange dot at position (83, 229) then Renders a orange disk with center (180, 91) and radius 72.
; PLAN: r0=187(x1), r1=147(y1), r2=241(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=229(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=180(x), r11=91(y), r12=72(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 187
LDI r1, 147
LDI r2, 241
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 229
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 180
LDI r11, 91
LDI r12, 72
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
