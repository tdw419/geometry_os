; DESCRIPTION: Composite: Draws a blue line from (184, 190) to (259, 212) then Renders a yellow disk with center (441, 97) and radius 45.
; PLAN: r0=184(x1), r1=190(y1), r2=259(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=97(y), r7=45(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 184
LDI r1, 190
LDI r2, 259
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 97
LDI r7, 45
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
