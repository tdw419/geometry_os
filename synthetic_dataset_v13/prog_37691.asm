; DESCRIPTION: Composite: Places a cyan circle of radius 75 at center (335, 114) then Sets a single red pixel at (205, 137) then Renders a black line between points (171, 28) and (303, 202).
; PLAN: r0=335(x), r1=114(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x), r6=137(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=171(x1), r11=28(y1), r12=303(x2), r13=202(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 114
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 137
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 171
LDI r11, 28
LDI r12, 303
LDI r13, 202
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
