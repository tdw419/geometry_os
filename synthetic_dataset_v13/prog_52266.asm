; DESCRIPTION: Composite: Renders a green disk with center (394, 101) and radius 62 then Places a purple line segment connecting (86, 106) to (122, 233).
; PLAN: r0=394(x), r1=101(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x1), r6=106(y1), r7=122(x2), r8=233(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 101
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 106
LDI r7, 122
LDI r8, 233
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
