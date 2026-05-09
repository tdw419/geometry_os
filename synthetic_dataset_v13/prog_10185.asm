; DESCRIPTION: Composite: Renders a red line between points (317, 72) and (472, 247) then Renders a white disk with center (277, 155) and radius 23 then Sets a single green pixel at (174, 198).
; PLAN: r0=317(x1), r1=72(y1), r2=472(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=155(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=174(x), r11=198(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 317
LDI r1, 72
LDI r2, 472
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 155
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 174
LDI r11, 198
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
