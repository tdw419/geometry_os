; DESCRIPTION: Composite: Places a cyan line segment connecting (80, 110) to (408, 3) then Renders a blue disk with center (169, 192) and radius 21 then Places a purple dot at position (170, 109).
; PLAN: r0=80(x1), r1=110(y1), r2=408(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=192(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=170(x), r11=109(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 80
LDI r1, 110
LDI r2, 408
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 192
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 170
LDI r11, 109
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
