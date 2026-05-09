; DESCRIPTION: Composite: Sets a single white pixel at (87, 26) then Creates a orange circular shape at (457, 208) with radius 35 then Renders a green line between points (163, 210) and (505, 24).
; PLAN: r0=87(x), r1=26(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=457(x), r6=208(y), r7=35(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=163(x1), r11=210(y1), r12=505(x2), r13=24(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 26
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 457
LDI r6, 208
LDI r7, 35
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 163
LDI r11, 210
LDI r12, 505
LDI r13, 24
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
