; DESCRIPTION: Composite: Places a cyan dot at position (289, 241) then Renders a yellow disk with center (80, 99) and radius 70 then Renders a purple line between points (509, 199) and (277, 225).
; PLAN: r0=289(x), r1=241(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=99(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=509(x1), r11=199(y1), r12=277(x2), r13=225(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 241
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 80
LDI r6, 99
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 509
LDI r11, 199
LDI r12, 277
LDI r13, 225
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
