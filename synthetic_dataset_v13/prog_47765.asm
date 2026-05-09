; DESCRIPTION: Composite: Places a cyan line segment connecting (149, 129) to (419, 208) then Places a red dot at position (254, 177) then Renders a green disk with center (454, 98) and radius 46.
; PLAN: r0=149(x1), r1=129(y1), r2=419(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=177(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=454(x), r11=98(y), r12=46(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 149
LDI r1, 129
LDI r2, 419
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 177
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 454
LDI r11, 98
LDI r12, 46
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
