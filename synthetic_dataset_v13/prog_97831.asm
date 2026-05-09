; DESCRIPTION: Composite: Places a green circle of radius 61 at center (338, 188) then Sets a single black pixel at (95, 207) then Renders a red line between points (344, 80) and (146, 79).
; PLAN: r0=338(x), r1=188(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=207(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=344(x1), r11=80(y1), r12=146(x2), r13=79(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 188
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 207
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 344
LDI r11, 80
LDI r12, 146
LDI r13, 79
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
