; DESCRIPTION: Composite: Renders a red line between points (224, 133) and (507, 235) then Sets a single green pixel at (270, 212) then Creates a black circular shape at (281, 126) with radius 53.
; PLAN: r0=224(x1), r1=133(y1), r2=507(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=212(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=281(x), r11=126(y), r12=53(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 224
LDI r1, 133
LDI r2, 507
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 212
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 281
LDI r11, 126
LDI r12, 53
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
