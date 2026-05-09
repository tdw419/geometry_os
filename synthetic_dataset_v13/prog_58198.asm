; DESCRIPTION: Composite: Creates a green circular shape at (123, 44) with radius 24 then Sets a single red pixel at (406, 161) then Renders a purple line between points (19, 31) and (285, 106).
; PLAN: r0=123(x), r1=44(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=161(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=19(x1), r11=31(y1), r12=285(x2), r13=106(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 44
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 161
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 19
LDI r11, 31
LDI r12, 285
LDI r13, 106
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
