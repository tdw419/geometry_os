; DESCRIPTION: Composite: Places a green circle of radius 74 at center (413, 133) then Sets a single black pixel at (444, 221) then Renders a red line between points (173, 34) and (440, 252).
; PLAN: r0=413(x), r1=133(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=221(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=173(x1), r11=34(y1), r12=440(x2), r13=252(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 133
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 221
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 173
LDI r11, 34
LDI r12, 440
LDI r13, 252
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
