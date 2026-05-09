; DESCRIPTION: Composite: Places a yellow line segment connecting (184, 193) to (116, 112) then Places a orange dot at position (500, 41) then Renders a orange disk with center (189, 177) and radius 54.
; PLAN: r0=184(x1), r1=193(y1), r2=116(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=500(x), r6=41(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=189(x), r11=177(y), r12=54(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 184
LDI r1, 193
LDI r2, 116
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 500
LDI r6, 41
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 189
LDI r11, 177
LDI r12, 54
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
