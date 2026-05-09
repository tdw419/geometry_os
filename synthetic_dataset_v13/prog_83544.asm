; DESCRIPTION: Composite: Creates a yellow circular shape at (20, 192) with radius 16 then Places a magenta dot at position (489, 62) then Renders a blue line between points (30, 83) and (155, 197).
; PLAN: r0=20(x), r1=192(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=489(x), r6=62(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=30(x1), r11=83(y1), r12=155(x2), r13=197(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 192
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 489
LDI r6, 62
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 30
LDI r11, 83
LDI r12, 155
LDI r13, 197
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
