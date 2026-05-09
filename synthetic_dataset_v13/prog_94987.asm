; DESCRIPTION: Composite: Sets a single white pixel at (482, 70) then Renders a green line between points (253, 141) and (8, 52) then Renders a orange disk with center (414, 84) and radius 63.
; PLAN: r0=482(x), r1=70(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=253(x1), r6=141(y1), r7=8(x2), r8=52(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=414(x), r11=84(y), r12=63(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 482
LDI r1, 70
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 253
LDI r6, 141
LDI r7, 8
LDI r8, 52
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 84
LDI r12, 63
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
