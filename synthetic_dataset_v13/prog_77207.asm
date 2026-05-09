; DESCRIPTION: Composite: Renders a purple line between points (487, 229) and (198, 86) then Sets a single orange pixel at (122, 117) then Renders a white disk with center (263, 54) and radius 17.
; PLAN: r0=487(x1), r1=229(y1), r2=198(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=117(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=263(x), r11=54(y), r12=17(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 487
LDI r1, 229
LDI r2, 198
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 117
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 263
LDI r11, 54
LDI r12, 17
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
