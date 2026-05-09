; DESCRIPTION: Composite: Places a red dot at position (250, 221) then Creates a magenta circular shape at (483, 147) with radius 16 then Draws a red line from (326, 254) to (145, 86).
; PLAN: r0=250(x), r1=221(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=483(x), r6=147(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=326(x1), r11=254(y1), r12=145(x2), r13=86(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 221
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 483
LDI r6, 147
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 326
LDI r11, 254
LDI r12, 145
LDI r13, 86
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
