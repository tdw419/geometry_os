; DESCRIPTION: Composite: Creates a orange circular shape at (302, 166) with radius 41 then Sets a single yellow pixel at (328, 150) then Renders a white line between points (5, 203) and (417, 186).
; PLAN: r0=302(x), r1=166(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x), r6=150(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=5(x1), r11=203(y1), r12=417(x2), r13=186(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 166
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 150
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 5
LDI r11, 203
LDI r12, 417
LDI r13, 186
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
