; DESCRIPTION: Composite: Renders a yellow disk with center (206, 169) and radius 27 then Renders a orange line between points (47, 91) and (124, 102).
; PLAN: r0=206(x), r1=169(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x1), r6=91(y1), r7=124(x2), r8=102(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 169
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 91
LDI r7, 124
LDI r8, 102
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
