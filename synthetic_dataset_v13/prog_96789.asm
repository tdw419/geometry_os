; DESCRIPTION: Composite: Renders a yellow disk with center (122, 171) and radius 66 then Places a red dot at position (444, 162) then Renders a purple line between points (139, 244) and (437, 242).
; PLAN: r0=122(x), r1=171(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=162(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=139(x1), r11=244(y1), r12=437(x2), r13=242(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 171
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 162
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 139
LDI r11, 244
LDI r12, 437
LDI r13, 242
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
