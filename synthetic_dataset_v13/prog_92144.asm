; DESCRIPTION: Composite: Places a black line segment connecting (13, 6) to (408, 182) then Places a purple dot at position (141, 12) then Renders a blue disk with center (383, 111) and radius 61.
; PLAN: r0=13(x1), r1=6(y1), r2=408(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=12(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=383(x), r11=111(y), r12=61(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 13
LDI r1, 6
LDI r2, 408
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 12
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 383
LDI r11, 111
LDI r12, 61
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
