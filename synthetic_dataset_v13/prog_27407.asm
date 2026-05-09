; DESCRIPTION: Composite: Places a blue dot at position (392, 12) then Renders a orange disk with center (145, 225) and radius 13 then Renders a purple line between points (39, 242) and (402, 165).
; PLAN: r0=392(x), r1=12(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=225(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=39(x1), r11=242(y1), r12=402(x2), r13=165(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 12
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 145
LDI r6, 225
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 39
LDI r11, 242
LDI r12, 402
LDI r13, 165
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
