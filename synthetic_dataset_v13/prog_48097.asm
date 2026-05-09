; DESCRIPTION: Composite: Places a black dot at position (301, 89) then Places a orange circle of radius 19 at center (408, 134) then Places a yellow line segment connecting (237, 38) to (54, 220).
; PLAN: r0=301(x), r1=89(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=408(x), r6=134(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=237(x1), r11=38(y1), r12=54(x2), r13=220(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 89
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 408
LDI r6, 134
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 237
LDI r11, 38
LDI r12, 54
LDI r13, 220
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
