; DESCRIPTION: Composite: Renders a red line between points (264, 79) and (131, 140) then Creates a blue circular shape at (393, 80) with radius 63.
; PLAN: r0=264(x1), r1=79(y1), r2=131(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=80(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 264
LDI r1, 79
LDI r2, 131
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 80
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
