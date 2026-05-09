; DESCRIPTION: Composite: Places a red dot at position (381, 121) then Places a yellow circle of radius 80 at center (323, 168) then Places a magenta line segment connecting (52, 71) to (142, 145).
; PLAN: r0=381(x), r1=121(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=323(x), r6=168(y), r7=80(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=52(x1), r11=71(y1), r12=142(x2), r13=145(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 121
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 323
LDI r6, 168
LDI r7, 80
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 52
LDI r11, 71
LDI r12, 142
LDI r13, 145
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
