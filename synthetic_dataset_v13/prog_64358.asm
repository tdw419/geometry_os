; DESCRIPTION: Composite: Places a yellow dot at position (172, 70) then Places a magenta line segment connecting (144, 47) to (141, 142) then Renders a yellow disk with center (340, 127) and radius 40.
; PLAN: r0=172(x), r1=70(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=144(x1), r6=47(y1), r7=141(x2), r8=142(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=127(y), r12=40(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 172
LDI r1, 70
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 144
LDI r6, 47
LDI r7, 141
LDI r8, 142
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 127
LDI r12, 40
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
