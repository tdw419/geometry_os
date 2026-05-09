; DESCRIPTION: Composite: Places a blue dot at position (478, 52) then Places a magenta circle of radius 44 at center (81, 139) then Draws a black line from (506, 106) to (431, 30).
; PLAN: r0=478(x), r1=52(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=139(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=506(x1), r11=106(y1), r12=431(x2), r13=30(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 478
LDI r1, 52
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 139
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 506
LDI r11, 106
LDI r12, 431
LDI r13, 30
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
