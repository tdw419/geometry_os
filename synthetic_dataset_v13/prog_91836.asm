; DESCRIPTION: Composite: Places a white line segment connecting (221, 77) to (405, 81) then Renders a orange disk with center (381, 145) and radius 58 then Sets a single blue pixel at (300, 55).
; PLAN: r0=221(x1), r1=77(y1), r2=405(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=145(y), r7=58(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=300(x), r11=55(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 221
LDI r1, 77
LDI r2, 405
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 145
LDI r7, 58
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 300
LDI r11, 55
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
