; DESCRIPTION: Composite: Places a orange circle of radius 20 at center (78, 107) then Places a red line segment connecting (118, 0) to (470, 204) then Sets a single yellow pixel at (209, 102).
; PLAN: r0=78(x), r1=107(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x1), r6=0(y1), r7=470(x2), r8=204(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=209(x), r11=102(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 78
LDI r1, 107
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 0
LDI r7, 470
LDI r8, 204
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 102
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
