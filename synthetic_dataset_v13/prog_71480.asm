; DESCRIPTION: Composite: Places a yellow circle of radius 52 at center (116, 147) then Places a cyan dot at position (94, 226) then Places a blue line segment connecting (408, 130) to (38, 44).
; PLAN: r0=116(x), r1=147(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=226(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=408(x1), r11=130(y1), r12=38(x2), r13=44(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 147
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 226
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 408
LDI r11, 130
LDI r12, 38
LDI r13, 44
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
