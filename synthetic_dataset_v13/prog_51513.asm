; DESCRIPTION: Composite: Places a yellow dot at position (130, 108) then Places a white line segment connecting (237, 242) to (291, 208) then Creates a purple circular shape at (112, 171) with radius 75.
; PLAN: r0=130(x), r1=108(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=237(x1), r6=242(y1), r7=291(x2), r8=208(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=112(x), r11=171(y), r12=75(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 130
LDI r1, 108
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 237
LDI r6, 242
LDI r7, 291
LDI r8, 208
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 171
LDI r12, 75
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
