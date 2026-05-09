; DESCRIPTION: Composite: Renders a black line between points (156, 136) and (162, 164) then Renders a green disk with center (409, 190) and radius 65.
; PLAN: r0=156(x1), r1=136(y1), r2=162(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=190(y), r7=65(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 136
LDI r2, 162
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 190
LDI r7, 65
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
