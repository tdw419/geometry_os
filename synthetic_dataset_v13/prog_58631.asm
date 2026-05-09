; DESCRIPTION: Composite: Places a red circle of radius 37 at center (125, 201) then Draws a blue line from (511, 240) to (469, 79) then Places a blue dot at position (357, 188).
; PLAN: r0=125(x), r1=201(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=511(x1), r6=240(y1), r7=469(x2), r8=79(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=188(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 125
LDI r1, 201
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 511
LDI r6, 240
LDI r7, 469
LDI r8, 79
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 188
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
