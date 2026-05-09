; DESCRIPTION: Composite: Places a blue circle of radius 65 at center (242, 162) then Places a purple line segment connecting (131, 26) to (201, 171) then Places a red dot at position (274, 227).
; PLAN: r0=242(x), r1=162(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x1), r6=26(y1), r7=201(x2), r8=171(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=227(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 242
LDI r1, 162
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 26
LDI r7, 201
LDI r8, 171
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 227
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
