; DESCRIPTION: Composite: Renders a orange line between points (253, 55) and (133, 68) then Places a cyan dot at position (296, 0) then Creates a yellow circular shape at (445, 74) with radius 52.
; PLAN: r0=253(x1), r1=55(y1), r2=133(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=0(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=445(x), r11=74(y), r12=52(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 253
LDI r1, 55
LDI r2, 133
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 0
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 445
LDI r11, 74
LDI r12, 52
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
