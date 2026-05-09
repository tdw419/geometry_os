; DESCRIPTION: Composite: Draws a green circle centered at (312, 153) with radius 37 then Places a purple dot at position (406, 40) then Renders a red line between points (118, 18) and (38, 181).
; PLAN: r0=312(x), r1=153(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=40(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=118(x1), r11=18(y1), r12=38(x2), r13=181(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 153
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 40
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 118
LDI r11, 18
LDI r12, 38
LDI r13, 181
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
