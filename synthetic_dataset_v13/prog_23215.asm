; DESCRIPTION: Composite: Renders a green line between points (115, 67) and (195, 104) then Places a magenta dot at position (86, 1) then Creates a purple circular shape at (294, 84) with radius 16.
; PLAN: r0=115(x1), r1=67(y1), r2=195(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=1(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=294(x), r11=84(y), r12=16(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 115
LDI r1, 67
LDI r2, 195
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 1
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 294
LDI r11, 84
LDI r12, 16
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
