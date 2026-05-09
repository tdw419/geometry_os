; DESCRIPTION: Composite: Sets a single green pixel at (155, 92) then Renders a purple disk with center (63, 161) and radius 58 then Renders a white line between points (18, 57) and (119, 54).
; PLAN: r0=155(x), r1=92(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=161(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x1), r11=57(y1), r12=119(x2), r13=54(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 92
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 63
LDI r6, 161
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 57
LDI r12, 119
LDI r13, 54
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
