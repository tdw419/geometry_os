; DESCRIPTION: Composite: Creates a green circular shape at (87, 82) with radius 78 then Places a blue dot at position (269, 232) then Renders a purple line between points (308, 58) and (359, 168).
; PLAN: r0=87(x), r1=82(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=232(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=308(x1), r11=58(y1), r12=359(x2), r13=168(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 82
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 232
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 308
LDI r11, 58
LDI r12, 359
LDI r13, 168
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
