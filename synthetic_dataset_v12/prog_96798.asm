; DESCRIPTION: Composite: Renders a magenta line between points (186, 5) and (14, 87) then Renders a green disk with center (190, 159) and radius 76.
; PLAN: r0=186(x1), r1=5(y1), r2=14(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=159(y), r7=76(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 186
LDI r1, 5
LDI r2, 14
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 159
LDI r7, 76
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
