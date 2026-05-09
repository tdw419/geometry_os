; DESCRIPTION: Composite: Renders a yellow disk with center (463, 199) and radius 13 then Renders a green line between points (58, 198) and (495, 108).
; PLAN: r0=463(x), r1=199(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x1), r6=198(y1), r7=495(x2), r8=108(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 199
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 198
LDI r7, 495
LDI r8, 108
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
