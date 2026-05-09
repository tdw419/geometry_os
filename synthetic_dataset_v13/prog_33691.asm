; DESCRIPTION: Composite: Renders a yellow disk with center (392, 151) and radius 23 then Sets a single red pixel at (468, 28) then Renders a green line between points (217, 223) and (505, 33).
; PLAN: r0=392(x), r1=151(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=468(x), r6=28(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=217(x1), r11=223(y1), r12=505(x2), r13=33(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 151
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 468
LDI r6, 28
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 217
LDI r11, 223
LDI r12, 505
LDI r13, 33
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
