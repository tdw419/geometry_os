; DESCRIPTION: Composite: Renders a green line between points (312, 7) and (16, 240) then Sets a single orange pixel at (461, 106) then Creates a white circular shape at (303, 153) with radius 35.
; PLAN: r0=312(x1), r1=7(y1), r2=16(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=461(x), r6=106(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=303(x), r11=153(y), r12=35(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 312
LDI r1, 7
LDI r2, 16
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 106
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 303
LDI r11, 153
LDI r12, 35
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
