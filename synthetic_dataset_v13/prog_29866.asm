; DESCRIPTION: Composite: Places a green circle of radius 79 at center (169, 141) then Renders a orange line between points (438, 208) and (204, 202).
; PLAN: r0=169(x), r1=141(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x1), r6=208(y1), r7=204(x2), r8=202(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 141
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 208
LDI r7, 204
LDI r8, 202
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
