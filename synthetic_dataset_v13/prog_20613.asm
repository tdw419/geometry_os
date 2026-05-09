; DESCRIPTION: Composite: Renders a red disk with center (176, 218) and radius 34 then Places a green dot at position (157, 225) then Places a black line segment connecting (388, 121) to (207, 61).
; PLAN: r0=176(x), r1=218(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=225(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=388(x1), r11=121(y1), r12=207(x2), r13=61(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 218
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 225
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 388
LDI r11, 121
LDI r12, 207
LDI r13, 61
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
