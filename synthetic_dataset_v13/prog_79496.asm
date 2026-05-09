; DESCRIPTION: Composite: Renders a cyan line between points (160, 220) and (417, 128) then Places a blue dot at position (133, 124) then Creates a purple circular shape at (297, 145) with radius 36.
; PLAN: r0=160(x1), r1=220(y1), r2=417(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=124(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=297(x), r11=145(y), r12=36(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 160
LDI r1, 220
LDI r2, 417
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 124
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 297
LDI r11, 145
LDI r12, 36
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
