; DESCRIPTION: Composite: Creates a white circular shape at (272, 163) with radius 30 then Sets a single yellow pixel at (441, 220) then Renders a magenta line between points (218, 119) and (346, 18).
; PLAN: r0=272(x), r1=163(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x), r6=220(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=218(x1), r11=119(y1), r12=346(x2), r13=18(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 163
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 220
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 218
LDI r11, 119
LDI r12, 346
LDI r13, 18
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
