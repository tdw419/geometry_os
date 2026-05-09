; DESCRIPTION: Composite: Renders a purple line between points (416, 174) and (100, 142) then Sets a single black pixel at (218, 151) then Places a magenta circle of radius 41 at center (53, 60).
; PLAN: r0=416(x1), r1=174(y1), r2=100(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=151(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=53(x), r11=60(y), r12=41(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 416
LDI r1, 174
LDI r2, 100
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 151
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 53
LDI r11, 60
LDI r12, 41
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
