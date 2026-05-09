; DESCRIPTION: Composite: Renders a yellow disk with center (193, 194) and radius 22 then Places a blue line segment connecting (76, 147) to (190, 169).
; PLAN: r0=193(x), r1=194(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x1), r6=147(y1), r7=190(x2), r8=169(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 194
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 147
LDI r7, 190
LDI r8, 169
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
