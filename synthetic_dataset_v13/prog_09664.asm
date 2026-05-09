; DESCRIPTION: Composite: Renders a cyan disk with center (227, 179) and radius 61 then Sets a single black pixel at (55, 80) then Draws a black line from (402, 14) to (442, 233).
; PLAN: r0=227(x), r1=179(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=80(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=402(x1), r11=14(y1), r12=442(x2), r13=233(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 179
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 80
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 402
LDI r11, 14
LDI r12, 442
LDI r13, 233
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
