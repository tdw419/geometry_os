; DESCRIPTION: Composite: Places a black circle of radius 76 at center (385, 76) then Places a red dot at position (472, 8) then Renders a cyan line between points (2, 34) and (264, 0).
; PLAN: r0=385(x), r1=76(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x), r6=8(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=2(x1), r11=34(y1), r12=264(x2), r13=0(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 76
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 8
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 2
LDI r11, 34
LDI r12, 264
LDI r13, 0
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
