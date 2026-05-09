; DESCRIPTION: Composite: Creates a orange circular shape at (13, 41) with radius 13 then Places a magenta dot at position (118, 254) then Renders a blue line between points (162, 176) and (396, 114).
; PLAN: r0=13(x), r1=41(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=254(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=162(x1), r11=176(y1), r12=396(x2), r13=114(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 41
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 254
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 162
LDI r11, 176
LDI r12, 396
LDI r13, 114
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
