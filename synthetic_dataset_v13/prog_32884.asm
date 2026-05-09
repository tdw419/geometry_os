; DESCRIPTION: Composite: Creates a green circular shape at (184, 193) with radius 55 then Renders a magenta line between points (250, 219) and (423, 58).
; PLAN: r0=184(x), r1=193(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x1), r6=219(y1), r7=423(x2), r8=58(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 193
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 219
LDI r7, 423
LDI r8, 58
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
