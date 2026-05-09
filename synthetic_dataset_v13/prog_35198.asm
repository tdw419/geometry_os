; DESCRIPTION: Composite: Draws a black circle centered at (291, 201) with radius 29 then Places a red dot at position (213, 68) then Renders a yellow line between points (56, 99) and (107, 139).
; PLAN: r0=291(x), r1=201(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=213(x), r6=68(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=56(x1), r11=99(y1), r12=107(x2), r13=139(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 201
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 213
LDI r6, 68
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 56
LDI r11, 99
LDI r12, 107
LDI r13, 139
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
