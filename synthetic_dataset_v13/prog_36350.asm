; DESCRIPTION: Composite: Renders a yellow line between points (20, 211) and (456, 154) then Sets a single purple pixel at (80, 155) then Renders a red disk with center (218, 129) and radius 18.
; PLAN: r0=20(x1), r1=211(y1), r2=456(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=155(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=218(x), r11=129(y), r12=18(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 20
LDI r1, 211
LDI r2, 456
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 155
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 218
LDI r11, 129
LDI r12, 18
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
