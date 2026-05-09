; DESCRIPTION: Composite: Places a purple dot at position (337, 66) then Draws a black line from (90, 131) to (226, 34) then Draws a black circle centered at (279, 100) with radius 44.
; PLAN: r0=337(x), r1=66(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=90(x1), r6=131(y1), r7=226(x2), r8=34(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=100(y), r12=44(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 66
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 131
LDI r7, 226
LDI r8, 34
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 100
LDI r12, 44
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
