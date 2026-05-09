; DESCRIPTION: Composite: Renders a yellow disk with center (133, 166) and radius 76 then Renders a purple line between points (244, 4) and (359, 36) then Places a green dot at position (118, 15).
; PLAN: r0=133(x), r1=166(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x1), r6=4(y1), r7=359(x2), r8=36(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=118(x), r11=15(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 133
LDI r1, 166
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 4
LDI r7, 359
LDI r8, 36
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 118
LDI r11, 15
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
